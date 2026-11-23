# Scientific writing

- When a troubled cell switches reconstruction order, say it “falls back to lower-order reconstruction.” Use “flux correction” when the algorithm replaces a face flux. Describe repeated corrections as “each flux correction” or “the final flux correction.” Avoid “demotion,” “pass,” and “revision” for these operations.
- Name the reconstruction a cell uses. For example, write “cells already using piecewise constant reconstruction.” Avoid “bottom-tier cells.”
- Explain how a flux correction affects neighboring cells. For example, “Correcting the flux at a shared face changes the update in both cells and can cause the neighboring cell to fail the check.”
- For mesh boundaries, use “ghost cells.” When the width matters, specify the number of ghost-cell layers. Avoid “halo” in this context.
- When a test forces fallback, state which quantity it checks, the comparison it makes, and what happens in the cells that satisfy it. A phrase like “debug threshold” leaves those details unclear.
- When describing a code port, name the branch or commit the code was ported from. If a comparison used a different branch or commit, name that separately. Avoid “immediate donor” for the source of a port.
