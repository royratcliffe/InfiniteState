# InfiniteState IEC 61131-3 Library

The InfiniteState library is a CODESYS Structured Text (IEC 61131-3) library for tracking and navigating hierarchical machine states. It represents a state hierarchy as parent-child `Tuple` entries and keeps the machine’s active path as a `Chain`. When asked to move to a state, the machine finds the least-common ancestor of the current and target paths, exits the old branch, and enters the new one.

## Features

- Hierarchical state paths described by a caller-supplied array of `Tuple` values (`superState`, `subState`).

- `Machine.GoTo` transitions between states while retaining their shared ancestors.

- `Machine.InState`, `Machine.AtDepth`, and `Machine.Depth` inspect the active path.

- Entry and exit bookkeeping uses `SysTimeRtc` high-resolution timestamps.

- Helper functions build and compare state paths.

`STATE` is an alias for `UINT`; state `0` is the hierarchy's no-parent sentinel. The default path depth is indexed from `LOWER_DEPTH` (`0`) through `UPPER_DEPTH` (`7`). Adjust these constants in `Constants` if your application needs a different maximum depth.

## Repository layout

- `project/` — CODESYS project objects (`.object` JSON).

- `st/` — Structured Text sources extracted from those objects, organised by library namespace and object.

- `scripts/` — Python utilities for extracting and synchronising ST, formatting project JSON, watching for project changes, and updating version information.

The project objects and the extracted ST files are two representations of the same library. Keep them synchronised when making changes.

## Development

The repository scripts require Python 3. From the repository root:

``` powershell
# Extract ST source from the project objects into st/
python scripts/extract_st.py

# Check what would change in the project objects after editing st/
python scripts/update_st.py --dry-run

# Write the ST changes back into the project objects
python scripts/update_st.py
```

Both scripts accept alternate directories. For example:

``` powershell
python scripts/extract_st.py path\to\project -o path\to\st
python scripts/update_st.py path\to\project -i path\to\st --dry-run
```

After editing objects in CODESYS, run `extract_st.py` to refresh the ST sources. After editing files under `st/`, run `update_st.py` to apply those changes to the corresponding project objects. Review the resulting changes before committing.

To update the project version from Git history, run:

``` powershell
python scripts/update_version.py --dry-run
python scripts/update_version.py
```

The version updater needs a Git `main` or `master` branch (local or remote) to calculate the build number.

An optional pre-commit hook formats staged `.object` JSON files. Enable it with:

``` powershell
git config core.hooksPath scripts
```

## Using the library

Add the library objects to a CODESYS application and define its hierarchy as an array of `Tuple` values, one for each super-sub relationship. Pass that array to `Machine.GoTo` when selecting a target state. For example, a hierarchy may describe `1` as the parent of `2`, and `2` as the parent of `3`; navigating to `3` builds the active path `1` → `2` → `3`.

The machine exposes:

| Member | Purpose |
|------------------------------------|------------------------------------|
| `GoTo(state, hierarchy)` | Navigate to a state; returns whether the transition succeeded. |
| `InState(state)` | Test whether a state is in the active path. |
| `AtDepth(depth)` | Read the state at a path depth. |
| `Depth` | Read the current path depth. |

`GoTo` performs path and timestamp bookkeeping. Application-specific behaviour to run on state entry or exit should be implemented by the application around its state transitions.
