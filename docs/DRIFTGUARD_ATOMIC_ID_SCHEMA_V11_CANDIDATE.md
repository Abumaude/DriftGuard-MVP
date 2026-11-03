# DriftGuard Atomic-ID Schema v1.1. Review Candidate

Status: CANDIDATE / UNRATIFIED. Prepared 2026-11-03 under the operator-approved E1-E7 correction direction. This is a standalone proposal. The original 2026-05-17 v1 remains unchanged.

## Scope
Atomic identifiers are stable cross-repository addresses; they do not establish authority, evidence quality or approval. The historical source and any alternative-path copies must be reconciled before supersession.

## Address and validation
Format: `repo-slug/type/component-slug`, three lowercase ASCII kebab-case segments. The published v1 regex `^[a-z0-9-]+/[a-z0-9-]+/[a-z0-9-]+$` is necessary but insufficient. Enforce 3-40 characters for repo slug, 3-60 for component slug, and reject leading, trailing or repeated hyphens. Component names must be meaningful. Dated entities use ISO-like date or week prefixes when applicable. Portfolio namespace uniqueness requires an authoritative registry; no guessing.

## Universal types
project, variant, family, feature, module, decision, hypothesis, risk, opportunity, source-file, signal-ref, suggestion, intelligence. Variant-specific extensions require documented owner registration. `schema` is a proposed meta-extension, not a newly ratified universal type.

## Frontmatter
Required: `id`, `type`, `tags` (nonempty kebab-case array), `status`, `timestamp` (ISO 8601 date or datetime).
Lifecycle status: active, paused, blocked, archived, parked.
Optional: parent, depends-on, related-to, derived-from, subtype, source-repo, source-path, summary, themes.
ID's type segment and frontmatter `type` must agree. Do not confuse lifecycle status with review or approval state. The original suggestion example's `pending` value is not an allowed lifecycle status.

## References
Parent/lineage/relationship references must be three-segment atomic IDs that resolve locally or to a known external repository. The v1 header's `atlas/anchor` is unresolved and must not be silently replaced by an invented ID. Wiki links are navigational representations, not evidence of an existing referent.

## Extensions and paths
The original suggestion example's `source` and `target` fields require validation against its governing suggestion contract. They must not silently become generic provenance edges. Filename and ID agreement depends on a versioned repository-specific path mapping; flattened paths are not globally assumed.

## Time and projection
Retain the original timestamp precision. ISO date-only inputs do not imply timezone-aware datetimes. Signal OS's current catalogue UI must reject or separately review projections without source-backed `created` and `updated` precision.

## Adoption
Apply to new entities after governing ratification; retrofit existing ones lazily. No mass migration, forced ID reconstruction, automatic canon promotion or silent pattern exceptions.

## Open governance issues
- Confirm source equality, ownership and supersession route for v1.
- Register the `schema` extension or approve a bounded exception.
- Recover actual Atlas anchor identity.
- Confirm suggestion endpoint and review-state contracts.
- Approve per-repository path mappings and version-suffix rules.
- Approve date-only UI projection treatment.

**Decision state:** E1-E7 correction objectives accepted; exact canonical v1.1 wording and unresolved references NOT RATIFIED. Review against DriftGuard Issue #3 before publication.
