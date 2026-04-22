# AI Tools & Prompts

This project was developed with assistance from **Claude Sonnet 4.6** by Anthropic, accessed via **Claude Code** (CLI).

---

## Prompts Used

### README Generation

**Prompt:**
```
Generate a professional README.md for a Flutter Notes App built with Firebase (Auth + Firestore),
Clean Architecture, and BLoC state management.

Include the following sections:
- Project overview and tech stack table
- Features list
- Getting started: prerequisites, install dependencies, Firebase setup, Firestore Security Rules, and run command
- Sample login account (email + password)
- Firestore collection structure for `users` and `notes` (with field names, types, and descriptions)
- Project folder structure
- Reference to AI_PROMPT_README.md

Collections:
- users/{uid}: email (String), name (String), createdAt (Timestamp)
- notes/{noteId}: userId (String), title (String), content (String), createdAt (Timestamp), updatedAt (Timestamp)

Security rules must ensure each user can only read/write their own data.
```
