# Python Style Guidelines

## Type System
- Use Python 3.10+ native type hints: `list[str]`, `dict[str, Any]`
- Create type aliases for complex types: `Messages = list[dict[str, str]]`
- Import abstract decorators: `from abc import abstractmethod`

## Naming
- **Concise but meaningful**: `drop_messages()` not `delete_last_messages()`
- **Remove redundancy**: `_should_retry()` not `_is_retryable_error()`
- **Consistent terminology**: Use the same term across modules that refer to the same thing.
- **Short parameters**: `n` for counts, standard abbreviations only
- **No arbitrary abbreviations**: Keep `messages`, not `msgs`

## Documentation
- **One-line docstrings** for simple methods when possible
- **Concise and specific**: State exactly what the method does
- **No verbose Args/Returns** unless the method or data types are complex
- **Multiline starts with newline**: `"""\n    Description here.`
- **Natural text flow**: No arbitrary line breaks
- **No module-level docstrings**: Let class docstrings provide context

## Architecture
- **Template method pattern** to eliminate duplication
- **Symmetrical APIs** across related classes
- **Fail-fast validation** (authenticate in `__init__`)
- **Native sync/async** implementations, no thread pool faking
- **Single responsibility** for abstract methods

## Code Quality
- **Remove dead code** proactively
- **Focused classes** with essential methods only
- **Lazy imports** to avoid dependencies
- **Explicit over implicit** design choices

## File Format
- **Singular file names**: `client.py` not `clients.py`
- **Newlines at end of files** following Unix convention
