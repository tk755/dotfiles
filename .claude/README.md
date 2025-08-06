# Claude Code Workflows

## Design Feature Workflow (`/design-feature`)

Creates implementation specifications through discovery-driven development and theory-first collaborative architecture.

### Architecture

**Interactive command with autonomous agent:**

- **`/design-feature` command**: Interactive workflow for theory-first collaborative architecture
- **`codebase-explorer` agent**: Pure codebase discovery - understands what EXISTS

### Usage

```bash
/design-feature Add user authentication with JWT
/design-feature Implement caching layer for API responses  
/design-feature Fix the memory leak in batch processing
```

### How It Works

1. **🔍 Contextualization**: Uses `codebase-explorer` agent to analyze codebase objectively
2. **🛠️ Collaborative Refinement**: Interactive theory-first dialogue with user
3. **🧠 Deep Validation**: Ultrathinker exhaustive analysis
4. **🎯 User Validation**: Approval gate before specification generation  
5. **📐 Specification Generation**: Creates complete implementation specification in `./features/[FEATURE-NAME].md`

### Why This Works

- **Natural interaction**: Commands designed for human dialogue, agents for autonomous execution
- **Unbiased discovery**: Pure codebase analysis without feature contamination
- **Theory-first dialogue**: Multiple solutions explored, constraints discovered through conversation
- **Quality assurance**: Multiple validation phases ensure implementation success
