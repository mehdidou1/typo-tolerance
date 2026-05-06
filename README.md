# Typo-Tolerance

[![Pharo P14](https://img.shields.io/badge/Pharo-P14-2c98f0.svg)](https://github.com/pharo-completion/typo-tolerance)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/pharo-completion/typo-tolerance/blob/master/LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/pharo-completion/typo-tolerance/pulls)
[![Status: Active](https://img.shields.io/badge/status-active-success.svg)](https://github.com/pharo-completion/typo-tolerance)

Typo Tolerance is a Pharo extension that preserves prefix matching as the primary acceptance rule and uses approximate matching only as a fallback, with a configurable tolerance.

---

# Example:

<img width="924" height="652" alt="TypoTolerance" src="https://github.com/user-attachments/assets/084742a9-976d-430b-affa-1ff74ee1b78d" />

---

```smalltalk
Metacello new
  githubUser: 'pharo-completion' project: 'typo-tolerance' commitish: 'main' path: 'src';
  baseline: 'TypoTolerance';
  load.
```
