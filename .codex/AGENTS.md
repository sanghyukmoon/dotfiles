# Code style

* Simple, readable code; avoid unnecessary abstraction and defensive code.
* Do not add unnecessary safeguards unless explicitly requested.
* Use variable names that are consistent with the existing codebase; for new variable names, choose names that clearly express physical or logical meaning.


# Verification and artifacts

* Treat one-off implementation checks as temporary.
* Use local temporary directories for lightweight checks and temporary scratch directories for simulation, MPI/GPU, or substantial analysis.
* After successful verification, record concise evidence in the task plan, if one exists, and remove temporary artifacts.
* Preserve failed checks until resolved, and retain benchmarks or scientific results requiring user review.
* Do not add or commit test scripts and test problems unless explicitly requested.

# HPC jobs

* Inspect long-running simulation/analysis jobs every 30 minutes unless the user changes that interval.

# Git commits

* Make focused, small commits.
* For follow-up edits after user's feedback, ammend the commit rather than making new commit.
