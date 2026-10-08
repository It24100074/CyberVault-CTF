# CyberVault CTF Flag Validation

## Overview

CyberVault CTF uses **CTFd** as the central challenge and flag validation platform.

Each challenge contains one or more valid flags configured through the CTFd administration interface.

Participants solve a challenge, obtain the flag, and submit it through the CTFd challenge page.

---

## Flag Format

The CyberVault CTF uses the following flag format:

```text
CyberVault{example_flag}
```

The actual flag value is different for each challenge.

The flag format is consistent across all challenge stages.

---

## Validation Process

The flag validation process is:

1. The participant opens a challenge in CTFd.
2. The participant completes the intended challenge solution path.
3. The participant discovers the flag.
4. The participant enters the flag in the challenge submission field.
5. CTFd compares the submitted value with the configured valid flag.
6. If the flag is correct, the challenge is marked as solved.
7. If the flag is incorrect, CTFd rejects the submission.

---

## Correct Flag Test

To test the validation mechanism:

1. Open the CyberVault CTF platform.
2. Select a challenge.
3. Enter the correct flag.
4. Submit the flag.

Expected result:

```text
Correct
```

or an equivalent successful validation message.

The challenge should then be recorded as solved.

---

## Incorrect Flag Test

To verify that invalid submissions are rejected:

1. Open the same challenge.
2. Enter an incorrect flag.

Example:

```text
CyberVault{wrong_flag}
```

3. Submit the flag.

Expected result:

```text
Incorrect
```

or an equivalent rejection message.

The challenge must not be marked as solved.

---

## Flag Validation in CTFd

Challenge flags are configured from the CTFd administrator interface.

Typical configuration path:

```text
Admin Panel
→ Challenges
→ Select Challenge
→ Flags
```

The administrator defines the valid flag value for the challenge.

CTFd then validates player submissions against the configured flag.

---

## Validation Requirements

The validation mechanism should confirm that:

- Correct flags are accepted.
- Incorrect flags are rejected.
- Flags are associated with the correct challenge.
- Challenge progress is recorded correctly.
- Players cannot complete a challenge using an invalid flag.

---

## CyberVault Flag Chain

CyberVault uses a connected challenge flow.

Each stage provides:

- A valid challenge flag.
- Information or a clue required for the next stage.

The intended flow is:

```text
Stage 1
   ↓
Stage 2
   ↓
Stage 3
   ↓
Stage 4
   ↓
Stage 5
   ↓
Stage 6
```

This creates an end-to-end progression through the CyberVault CTF.

---

## Example Flag Structure

Example only:

```text
Stage 1: CyberVault{stage1_example}
Stage 2: CyberVault{stage2_example}
Stage 3: CyberVault{stage3_example}
Stage 4: CyberVault{stage4_example}
Stage 5: CyberVault{stage5_example}
Stage 6: CyberVault{stage6_example}
```

Actual challenge flags should be configured in the CTF platform and should not be exposed unnecessarily in public documentation.

---

## Verification During Demonstration

During the Assignment 02 video demonstration, Member 1 can verify the flag mechanism by showing:

1. The CTFd challenge page.
2. A deliberately incorrect flag submission.
3. CTFd rejecting the invalid flag.
4. The correct flag submission.
5. CTFd accepting the correct flag.
6. The challenge being recorded as solved.

This demonstrates that the flag validation mechanism is functioning correctly.

---

## Security Considerations

Challenge flags should not be exposed in:

- Public README files.
- Public screenshots.
- Public documentation.
- Source files accessible directly to participants unless intentionally part of the challenge.

The validation process should rely on the CTFd challenge configuration.

---

## Testing Evidence

Flag validation evidence can be stored in:

```text
evidence/member1/screenshots/
```

Recommended screenshots include:

```text
wrong-flag-rejected.png
correct-flag-accepted.png
challenge-solved.png
```

These screenshots can be used as evidence that the flag validation mechanism works as expected.

---

## Related Documentation

Additional Member 1 documentation:

```text
docs/member1/architecture.md
docs/member1/deployment.md
docs/member1/resource-usage.md
platform/network/network-design.md
platform/network/isolation.md
```

---

## Conclusion

CTFd provides the central validation mechanism for CyberVault CTF.

The platform ensures that valid flags are accepted, invalid flags are rejected, and successful challenge completion is recorded correctly.