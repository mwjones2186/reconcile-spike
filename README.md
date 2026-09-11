# reconcile-spike

**Disposable.** The trust-boundary spike for `reconcile-kernel` W-001, item 7. Nothing
here is reused in the demo repository.

The question it answers: can a pull request forge the `reconcile` verdict that branch
protection requires?

| Workflow | Trigger | Defined by | Token | Runs PR code? |
|---|---|---|---|---|
| `execute` | `pull_request` | the PR's own merge commit | `GITHUB_TOKEN` | **yes** — `run-checks.sh` |
| `reconcile` | `workflow_run` of `execute` | the default branch only | `GITHUB_TOKEN` (stage 1) | **no** — no checkout; the artifact is read as data |

Stage 1 posts the verdict with `GITHUB_TOKEN`, then shows that a same-repo PR can
forge it. Stage 2 moves the verdict to a GitHub App whose key lives in an environment
restricted to the default branch, and pins the required check to that App.
