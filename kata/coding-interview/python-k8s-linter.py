from pathlib import Path
from typing import Literal

import yaml


def lint_manifest(content: str) -> Literal["pass", "warn", "fail"]:
    """Parse yaml to pass/warn/fail linting results on manifest"""

    try:
        text = (
            Path(content.strip()).read_text()
            if Path(content.strip()).is_file()
            else content
        )
    except (OSError, ValueError):
        text = content

    warns, fails = 0, 0

    for doc in yaml.safe_load_all(text):
        if not isinstance(doc, dict):
            continue
        kind = doc.get("kind", "")
        labels = (doc.get("metadata") or {}).get("labels") or {}
        warns += (kind == "Pod") + ("striveworks.us/app" not in labels)

        spec = doc.get("spec") or {}
        pod_spec = (
            spec.get("template", {}).get("spec")
            or spec.get("jobTemplate", {})
            .get("spec", {})
            .get("template", {})
            .get("spec")
            or spec
        )
        psc = pod_spec.get("securityContext") or {}

        containers = (pod_spec.get("containers") or []) + (
            pod_spec.get("initContainers") or []
        )
        for c in containers:
            res = c.get("resources") or {}
            req, lim = res.get("requests") or {}, res.get("limits") or {}
            warns += not (req.get("cpu") and req.get("memory"))
            fails += not (lim.get("cpu") and lim.get("memory"))

            csc = c.get("securityContext") or {}
            u = csc.get("runAsUser", psc.get("runAsUser"))
            g = csc.get("runAsGroup", psc.get("runAsGroup"))
            fails += u != 1000 and g != 1000

    return "fail" if fails or warns >= 2 else "warn" if warns == 1 else "pass"
