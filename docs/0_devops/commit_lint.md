# Commit Linter

A commit linter enforces consistent commit message style in the repository (for example, Conventional Commits). The most common way is to use commitlint with a Git hook.

## Installation

The below needs to occur within the root directory of the repository, where **package.json** lives (or where it will be created).

Here’s why:

1. _node_modules/_ and **package.json** → `npm install` installs dependencies locally into a _node_modules/_ folder in the current working directory and updates that directory’s **package.json** and **package-lock.json**.

2. Git hook tooling (like Husky/Commitlint) → expects to find its configuration (**commitlint.config.js**, _.husky/_ folder) in the root of the repository alongside **package.json**.

Running `npm install` in the home directory or outside the repo will use _node_modules/_ and **package-lock.json** will end up there, and Git hooks won’t see them.

### Dependencies

Since I'm using Node.js/npm...

```bash
npm install --save-dev @commitlint/{config-conventional,cli} husky
```

- `@commitlint/cli` → the linter itself
- `@commitlint/config-conventional` → a ready-to-use ruleset (Conventional Commits), which can be overriden by adding custom rules to **package.json**
- `husky` → tool to manage Git hooks

### Configure commitlint

Create a file at the root of repo named **commitlint.config.js**, and include the below:

```javascript
module.exports = {
  extends: ['@commitlint/config-conventional'],
};
```

### Husky Hook Setup

Helpful: https://medium.com/@abpeter14/how-to-install-commitlint-husky-2024-f1157f14006f

> [!WARNING]
> 
> Executing `npx husky install` yields the following error: `husky - install command is DEPRECATED`, as this command no longer works for Husky v7.0+.
> 
> Additionally, `husky add` command yielded `husky - add command is DEPRECATED`, as this command was deprecated in Husky v9.

Originally, Google's response to `husky - add command is DEPRECATED` was `echo "npm test" > .husky/pre-commit`, but this resulted in the below:

```bash
❯ git commit -m "test commitlint"

> aws-transit-data@1.0.0 test
> echo "No tests configured"
```

I also got the below error frequently, when I simply created _.husky/**commit-msg**_ while **pre-commit** script was kept:

```bash
husky - pre-commit script failed (code 1)
```

This was confusing until I removed the `"test": "echo \"Error: no test specified\" && exit 1"` script from below in **package.json**:

```json
  "scripts": {
    "commitlint": "commitlint --edit",
    "prepare": "husky"
  },
```

...which meant that `npm test` in **pre-commit** was calling an undefined script (error shown below)!

```bash
❯ git commit -m "foo: this will fail"
npm error Missing script: "test"
npm error
npm error To see a list of scripts, run:
npm error   npm run
npm error A complete log of this run can be found in: /Users/jonathon/.npm/_logs/2025-08-24T16_18_28_412Z-debug-0.log
husky - pre-commit script failed (code 1)
```

Updated instruction:

1. Enable Husky in repo with `npx husky init`.
2. Rename _.husky/**pre-commit**_ to _.husky/**commit-msg**_.
2. Insert hook to latter file: `echo "npx --no -- commitlint --edit \$1" > .husky/commit-msg`

These steps ensure every commit message is checked before being accepted.

### Testing

This yields the desired result when testing:

```bash
❯ git commit -m "test commitlint"
⧗   input: ops: install husky

- use "prepare":"husky" script in pkg file
- modify "test" script to exclude testing

ref AWS-6
✖   type must be one of [build, chore, ci, docs, feat, fix, perf, refactor, revert, style, test] [type-enum]

✖   found 1 problems, 0 warnings
ⓘ   Get help: https://github.com/conventional-changelog/commitlint/#what-is-commitlint

husky - pre-commit script failed (code 1)
```

`git commit -m "fix: correct typo in function"` → ✅ Passes

`git commit -m "typo fix"` → ❌ Fails with an error about incorrect format

## Custom Rules

As mentioned at the beginning, the "Conventional Commits" ruleset can be overriden in **package.json**. The below rules have been modified.

### Message Prefix

Originally tested with this:

```json
"rules": {
  "type-enum": [
    2,
    "always",
    [
      "blarg"
    ]
  ]
}
```

The following error resulted (which is _good_):

```bash
❯ git commit
⧗   input: ops: test type-enum keyword

ref AWS-6
✖   type must be one of [blarg] [type-enum]

✖   found 1 problems, 0 warnings
ⓘ   Get help: https://github.com/conventional-changelog/commitlint/#what-is-commitlint

husky - commit-msg script failed (code 1)
```

Final configuration:

```json
"rules": {
  "type-enum": [
    2,
    "always",
    [
      "build",
      "docs",
      "feat",
      "fix",
      "ops",
      "refactor",
      "revert",
      "test"
    ]
  ]
}
```

### References and Prefixes

Configured as follows:

```json
"rules": {
  "references-empty": [2, "never"],
  "parserPreset": {
    "parserOpts": {
      "issuePrefixes": ["PROJ-"]
    }
  }
}
```

These configurations are used in conjunction because:

- `"references-empty": [2, "never"]` indicates that an issue key reference MUST exist
- `"issuePrefixes": ["PROJ-"]` specifies the syntax/prefix of said key

The following error resulted (which is _good_):

```bash
❯ git commit
⧗   input: ops: test ref-empty + issuePrefixes

ref AWS-6
✖   references may not be empty [references-empty]

✖   found 1 problems, 0 warnings
ⓘ   Get help: https://github.com/conventional-changelog/commitlint/#what-is-commitlint

husky - commit-msg script failed (code 1)
```

Final configuration:

```json
"rules": {
  "references-empty": [2, "never"],
  "parserPreset": {
    "parserOpts": {
      "issuePrefixes": ["AWS-"]
    }
  }
}
```

## Enforce in CI/CD

TBD
