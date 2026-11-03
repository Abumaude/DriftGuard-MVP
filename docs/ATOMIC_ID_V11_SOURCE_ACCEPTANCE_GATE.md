# Atomic ID v1.1. Source verification and acceptance checklist

Status: OPEN. Accompanies PR #4. No canonical promotion is permitted by completion of this checklist alone.

| Gate | Required evidence | Current result |
| --- | --- | --- |
| Source identity | Full original v1 plus version/hash and ownership route | User-supplied text examined; exact alternate-path equivalence unverified |
| Atlas anchor | Original `ANCHOR_atlas.md` frontmatter or registered atomic record | Not recovered in this review; `atlas/anchor` is invalid |
| Meta-type extension | Owning meta-variant record explicitly registering `schema` | Not verified |
| Suggestion contract | Governing definitions for `source`, `target` and review state | Not verified |
| Path mapping | Repo-specific atomic ID-to-path rule approved by owning repo | Not verified |
| Namespace registry | Registered repo slugs and unique ownership | Not independently verified |
| Timestamp projection | Approved handling of date-only source timestamps | Not approved for UI export |
| Canonical publication | Operator ruling, successor source, and preserved v1 lineage | Pending |

## Independently checked this review
- `DriftGuard-MVP` PR #4 remains a draft, mergeable without reported conflicts. No GitHub check runs were returned, so **CI is not evidenced**.
- A Library search located references to `ANCHOR_atlas.md` in DriftGuard's full-system ANCHOR but did not recover its source body or governing atomic ID.
- The content of original v1 was supplied directly by the operator in the Signal OS chat. This does not establish equality to `driftguard/references/atomic-id-schema.md`.

## Safe next execution
1. Retrieve the exact `ANCHOR_atlas.md` and owning extension / suggestion contracts from the DriftGuard Project knowledge or verified source archive.
2. Produce a source-by-source crosswalk without guessing identifiers.
3. Run substantive review of v1.1 candidate against those primary sources.
4. Once all prerequisites are satisfied, ask the operator to ratify the complete v1.1 text and approve publication in its actual governing location.
5. Only then promote validator enforcement in Signal OS and pilot real records.

**No merge recommendation:** PR #4 is a candidate review artifact. It must not be presented as a ratified schema.
