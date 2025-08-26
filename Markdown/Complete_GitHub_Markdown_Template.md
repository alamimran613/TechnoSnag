# Complete GitHub Markdown Template - Techno Snag

This is a **comprehensive GitHub Markdown file** that demonstrates every feature available in GitHub Flavored Markdown. Perfect for your YouTube tutorial!

## Table of Contents
- [Headers](#headers) ➡️ Create document structure with different heading levels.
- [Text Formatting](#text-formatting) ➡️ Format text with bold, italic, strikethrough, and special characters.
- [Lists](#lists) ➡️ Create ordered, unordered, nested, and task lists with checkboxes.
- [Links and Images](#links-and-images) ➡️ Add hyperlinks, references, and embed images.
- [Code](#code) ➡️ Display inline code and code blocks with syntax highlighting.
- [Tables](#tables) ➡️ Create structured data tables with alignment options.
- [Blockquotes](#blockquotes) ➡️ Add quoted text and nested quote blocks.
- [GitHub-Specific Features](#github-specific-features) ➡️ Use mentions, emojis, alerts, and GitHub-only features.
- [Advanced Features](#advanced-features) ➡️ Implement collapsible sections, footnotes, and HTML integration.

---

## Headers

```markdown
# H1 - Main Title
## H2 - Section Title
### H3 - Subsection
#### H4 - Sub-subsection
##### H5 - Small Header
###### H6 - Smallest Header
```

# H1 - Main Title
## H2 - Section Title  
### H3 - Subsection
#### H4 - Sub-subsection
##### H5 - Small Header
###### H6 - Smallest Header

Alternative syntax for H1 and H2:
```markdown
Alternative H1
==============

Alternative H2
--------------
```

Alternative H1
==============

Alternative H2
--------------

---

## Text Formatting

### Basic Formatting
```markdown
**Bold text** or __Bold text__
*Italic text* or _Italic text_
***Bold and Italic*** or ___Bold and Italic___
~~Strikethrough text~~
```

**Bold text** or __Bold text__  
*Italic text* or _Italic text_  
***Bold and Italic*** or ___Bold and Italic___  
~~Strikethrough text~~

### Special Characters
```markdown
Subscript: H<sub>2</sub>O
Superscript: X<sup>2</sup>
```

Subscript: H<sub>2</sub>O  
Superscript: a<sup>2</sup> * b<sup>5</sup>


---

## Lists

### Unordered Lists
```markdown
- Item 1
- Item 2
  - Nested item 2.1
  - Nested item 2.2
    - Double nested item
- Item 3

* Alternative syntax
* Using asterisks
* Works the same way
```

- Item 1
- Item 2
  - Nested item 2.1
  - Nested item 2.2
    - Double nested item
- Item 3

* Alternative syntax
* Using asterisks
* Works the same way

### Ordered Lists
```markdown
1. First item
2. Second item
   1. Nested ordered item
   2. Another nested item
3. Third item

1. You can use 1. for all
1. GitHub will auto-number
1. Makes editing easier
```

1. First item
2. Second item
   1. Nested ordered item
   2. Another nested item
3. Third item

1. You can use 1. for all
1. GitHub will auto-number
1. Makes editing easier

### Task Lists (GitHub Feature)
```markdown
- [x] Completed task
- [x] Another completed task
- [ ] Incomplete task
- [ ] @mentions, #refs, [links](), **formatting** supported
```

- [x] Another completed task
- [x] Incomplete task
- [ ] @mentions, #refs, [links](), **formatting** supported

---

## Links and Images

### Links
```markdown
[Inline link](https://github.com)
[Link with title](https://github.com "GitHub Homepage")
[Reference link][1]
[Relative link to file](./README.md)

Automatic link: https://github.com
Email link: <email@example.com>

[1]: https://github.com
```

[Inline link](https://github.com)  
[Link with title](https://github.com "GitHub Homepage")  
[Reference link][1]  
[Relative link to file](./README.md)  

Automatic link: https://github.com  
Email link: <email@example.com>

[1]: https://github.com

### Images
```markdown
![Alt text](https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png)
![Image with title](https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png "GitHub Logo")

Reference style image:
![GitHub Logo][logo]

[logo]: https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png
```

![Alt text](https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png)


<img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" 
     alt="GitHub Logo" 
     title="This is GitHub Logo" 
     width="400"
     height="400">
---

## Code

### Inline Code
```markdown
Use `git status` to check repository status
Install packages with `npm install`
```

Use `git status` to check repository status  
Install packages with `npm install`

### Code Blocks
````markdown
```javascript
function greetUser(name) {
    console.log(`Hello, ${name}!`);
    return `Welcome to Techno Snag!`;
}

greetUser("Imran");
```
````

```javascript
function greetUser(name) {
    console.log(`Hello, ${name}!`);
    return `Welcome to Techno Snag!`;
}

greetUser("Imran");
```

### Different Languages
````markdown
```python
def hello_world():
    print("Hello from Python!")

```bash
#!/bin/bash
echo "Hello from Bash!"
git clone https://github.com/user/repo.git
```

```json
{
  "name": "Techno Snag",
  "channel": "YouTube",
  "content": ["DevOps", "Tech Tutorials", "IT Solutions"]
}
```
````

```python
def hello_world():
    print("Hello from Python!")
```

```bash
#!/bin/bash
echo "Hello from Bash!"
git clone https://github.com/user/repo.git
```

```json
{
  "name": "Techno Snag",
  "channel": "YouTube",
  "content": ["DevOps", "Tech Tutorials", "IT Solutions"]
}
```

---

## Tables

### Basic Table
```markdown
| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Row 1    | Data     | More Data|
| Row 2    | Data     | More Data|
```

| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Row 1    | Data     | More Data|
| Row 2    | Data     | More Data|

### Aligned Tables
```markdown
| Left Aligned | Center Aligned | Right Aligned |
|:-------------|:--------------:|--------------:|
| Left         | Center         | Right         |
| Text         | Text           | Text          |
```

| Left Aligned | Center Aligned | Right Aligned |
|:-------------|:--------------:|--------------:|
| Left         | Center         | Right         |
| Text         | Text           | Text          |

### Table with Formatting
```markdown
| Command | Description | Example |
|---------|-------------|---------|
| `git status` | Check repository status | **Important** for tracking |
| `git add .` | Stage all changes | *Use carefully* |
| ~~`git rm`~~ | Remove files | Deprecated approach |
```

| Command | Description | Example |
|---------|-------------|---------|
| `git status` | Check repository status | **Important** for tracking |
| `git add .` | Stage all changes | *Use carefully* |
| ~~`git rm`~~ | Remove files | Deprecated approach |

---

## Blockquotes

### Simple Blockquote
```markdown
> This is a blockquote
> It can span multiple lines
> And supports **formatting**
```

> This is a blockquote
> It can span multiple lines
> And supports **formatting**

### Nested Blockquotes
```markdown
> Level 1 quote
>> Level 2 quote
>>> Level 3 quote
> Back to level 1
```

> Level 1 quote
>> Level 2 quote
>>> Level 3 quote
> Back to level 1

---

## GitHub-Specific Features

### Mentions and References
```markdown
@username - Mention a user
#123 - Reference an issue or PR
GH-123 - Alternative issue reference
username/repository#123 - Cross-repository reference
```

### Emojis
```markdown
GitHub supports emojis! :smile: :heart: :rocket:
:+1: :octocat: :shipit: :sparkles:

Some popular ones:
:star: :fork_and_knife: :computer: :bulb: :fire:
```

GitHub supports emojis! :smile: :heart: :rocket:  
:+1: :octocat: :shipit: :sparkles:

Some popular ones:  
:star: :fork_and_knife: :computer: :bulb: :fire:

---

## Advanced Features

### Alerts (GitHub Enhancement)
```markdown
> [!NOTE]
> This is a note alert - useful for general information

> [!IMPORTANT]  
> This is important information that users should know

> [!WARNING]
> This is a warning - be careful!

> [!CAUTION]
> This indicates dangerous or risky actions
```

> [!NOTE]
> This is a note alert - useful for general information

> [!IMPORTANT]  
> This is important information that users should know

> [!WARNING]
> This is a warning - be careful!

> [!CAUTION]
> This indicates dangerous or risky actions

### Footnotes
```markdown
Here's a sentence with a footnote[^1].
This has multiple footnotes[^2] [^3].

[^1]: This is the first footnote.
[^2]: This is the second footnote.
[^3]: This footnote has **formatting** and `code`.
```

Here's a sentence with a footnote[^1].  
This has multiple footnotes[^2] [^3].

[^1]: This is the first footnote.
[^2]: This is the second footnote.  
[^3]: This footnote has **formatting** and `code`.

### Collapsible Sections
```markdown
<details>
<summary>Click to expand!</summary>

### Hidden Content
This content is hidden by default.

- You can include lists
- **Formatted text**  
- `Code snippets`
- Even images!

</details>
```

<details>
<summary>Click to expand!</summary>

### Hidden Content
This content is hidden by default.

- You can include lists
- **Formatted text**  
- `Code snippets`
- Even images!

</details>

### HTML Tags
```markdown
<div align="center">
  <h2>Centered Title</h2>
  <p><em>This is centered using HTML</em></p>
</div>

<br>

<kbd>Ctrl</kbd> + <kbd>C</kbd> - Copy  
<kbd>Ctrl</kbd> + <kbd>V</kbd> - Paste

<mark>Highlighted text</mark>
```

<div align="center">
  <h2>Centered Title</h2>
  <p><em>This is centered using HTML</em></p>
</div>

<br>

<kbd>Ctrl</kbd> + <kbd>C</kbd> - Copy  
<kbd>Ctrl</kbd> + <kbd>V</kbd> - Paste

<mark>Highlighted text</mark>

### Escaping Characters
```markdown
\*This won't be italic\*
\# This won't be a header
\`This won't be code\`

Use backslash (\) to escape special characters
```

\*This won't be italic\*  
\# This won't be a header  
\`This won't be code\`

Use backslash (\) to escape special characters

---