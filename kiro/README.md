# AI Assistant Configuration

Prompts and guidelines for AI CLI assistant (Kiro/Amazon Q) optimized for software development workflows.

## Files

- **pre_chat_guidelines.txt** - General AI assistant behavior rules
- **text_review_prompt.txt** - Specialized text review agent configuration

## Features

### General Guidelines
- Terse, efficient communication
- Task-oriented workflow
- Worklog-based task tracking
- Context preservation across sessions
- MCP (Model Context Protocol) integration

### Text Review Agent
- Grammar and spelling correction
- Clarity and readability improvements
- Tone adjustment for different audiences
- Performance tracking and metrics
- Worklog-based improvement tracking

## Installation

```bash
# Create directories
mkdir -p ~/.aws/amazonq
mkdir -p ~/.aws/amazonq/profiles/text-review

# Copy files
cp pre_chat_guidelines.txt ~/.aws/amazonq/
cp text_review_prompt.txt ~/.aws/amazonq/profiles/text-review/profile_pre_chat.txt
```

## General Guidelines

### Communication Style
- **Terse** - Every word costs money and context
- **No flattery** - Skip superlatives and fluff
- **No repetition** - Don't repeat user's question
- **Direct** - State what you'll do, then do it
- **Collaborative** - Use user's knowledge when stuck

### Worklog System
- Maintains task logs for each agent
- Enables resuming interrupted work
- Recovers from context overflows
- Stored in `~/AmazonQ/worklog/[agent_name]`

### Task Resumption
1. List files in worklog directory
2. Find best match for current task
3. Read task log
4. Ask if progress was made offline

### New Task Initiation
1. Collect requirements
2. Ask questions until goal is clear
3. Create task file in worklog directory

### Task Log Structure
1. **Task Definition** - Title, reference, summary
2. **Plan** - Top-level steps
3. **Sections** - One per major step with status
4. **Useful Info** - Commands, files, directives

### Update Triggers
- At milestones
- When asked
- On scope change
- When critical info available
- First update: After understanding, before work

## Text Review Agent

### Purpose
Reviews written communication for:
- Grammar and spelling
- Clarity and readability
- Simplicity and conciseness
- Appropriate tone

### Audience Types
- **Leadership/Management** - Formal, concise, business-focused
- **Staff (Peers & Manager)** - Professional, collaborative
- **My Team** - Direct, supportive, technical
- **General** - Professional standard

### Output Format
1. **Issues Found** - Specific problems
2. **Revised Version** - Corrected text
3. **Alternative Version** - Better approach (if applicable)
4. **Audience Notes** - Appropriateness comments

### Message Types
- Email
- Slack message
- Ticket comment
- General note

### Performance Tracking
- Tracks error types and patterns
- Maintains metrics in worklog
- Helps identify improvement areas
- Reports only when explicitly asked

## Usage

### General Agent
```bash
# Launch with specific agent
q chat --agent <agent_name>

# Quick command
q chat --no-interactive "your command"
```

### Text Review
```bash
# Using custom alias (if configured)
qq "review this text"

# Full command
q chat --model claude-4-sonnet --profile text-review "your text"
```

### Worklog Management
```bash
# List worklogs
ls ~/AmazonQ/worklog/<agent_name>/

# View specific worklog
cat ~/AmazonQ/worklog/<agent_name>/task.md
```

## Configuration

### Agent Config Location
```
~/.aws/amazonq/cli-agents/<agent_name>.json
```

### Profile Config Location
```
~/.aws/amazonq/profiles/<profile_name>/
```

### Worklog Location
```
~/AmazonQ/worklog/<agent_name>/
```

## Customization

### Modify General Guidelines
Edit `~/.aws/amazonq/pre_chat_guidelines.txt`

Key sections:
- Communication rules
- Worklog behavior
- Task management
- MCP configuration

### Modify Text Review
Edit `~/.aws/amazonq/profiles/text-review/profile_pre_chat.txt`

Customize:
- Review criteria
- Audience types
- Output format
- Tracking behavior

### Create New Agent
1. Create agent config JSON
2. Create profile directory
3. Add pre-chat guidelines
4. Create worklog directory

## Best Practices

### General Usage
1. **Be specific** - Clear, direct requests
2. **Use worklogs** - Track complex tasks
3. **Resume properly** - Always check worklog first
4. **Update regularly** - Keep worklogs current
5. **Leverage context** - Reference previous work

### Text Review
1. **Specify audience** - Always mention target audience
2. **Specify type** - Email, Slack, ticket, etc.
3. **Review metrics** - Periodically check improvement
4. **Learn patterns** - Identify common mistakes
5. **Apply feedback** - Use suggestions to improve

## Tips

### Efficient Communication
- Start with the ask
- Provide context concisely
- Reference worklog files
- Use bullet points
- Avoid unnecessary details

### Task Management
- One task per worklog file
- Clear, descriptive filenames
- Update at logical breakpoints
- Include useful commands
- Note important decisions

### Text Review
- Review before sending important messages
- Check tone for audience
- Use alternative versions for ideas
- Track improvement over time
- Learn from common errors

## Troubleshooting

### Agent Not Loading Guidelines
1. Check file location
2. Verify file permissions
3. Check agent config JSON
4. Restart agent

### Worklog Not Updating
1. Check directory permissions
2. Verify path in guidelines
3. Manually create if needed
4. Check agent config

### Text Review Not Tracking
1. Verify worklog path
2. Check file permissions
3. Manually create worklog file
4. Review tracking settings

## Integration

### Shell Aliases
```bash
# Quick agent picker
alias qp='path/to/agent-launcher.sh'

# Quick text review
qq() {
  q chat --model claude-4-sonnet --profile text-review "$*"
}
```

### Editor Integration
- Use from within editor
- Review commit messages
- Check documentation
- Validate comments

### Workflow Integration
- Pre-commit text review
- PR description review
- Documentation review
- Email drafting

## Privacy & Security

### Sanitization
- Remove sensitive information
- Replace company names
- Anonymize personal data
- Use placeholders

### Best Practices
- Don't include secrets
- Avoid proprietary code
- Sanitize logs
- Review before sharing

## Updates

### Update Guidelines
1. Edit guideline files
2. Test with sample tasks
3. Verify behavior
4. Document changes

### Version Control
- Keep guidelines in git
- Track changes
- Document rationale
- Share improvements

## Additional Resources

- AI CLI documentation
- MCP protocol specification
- Agent configuration examples
- Worklog templates
