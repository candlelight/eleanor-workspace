# Email Setup - AgentMail

**Source:** Discord conversation with Cat Mihos (Renata)  
**Date:** 2026-03-07  
**Status:** ✅ FULLY OPERATIONAL

## Overview
AgentMail (agentmail.to) provides AI agents with:
- Dedicated email address (e.g., eleanor@agentmail.to)
- REST API for sending/receiving
- Real-time webhook notifications
- Free tier available

## Active Configuration

**Email:** efox@agentmail.to  
**Status:** Can send, receive, and reply to emails  
**API Key:** Stored in `/root/.openclaw/workspace/send_reply.sh`  

### Scripts
- **Send/Reply:** `/root/.openclaw/workspace/send_reply.sh`
- **Check Email:** `/root/.openclaw/workspace/scripts/check_email.sh`
- **Test:** `/root/.openclaw/workspace/test-agentmail.sh`

### Automation Schedule
**Check Times (PST):** 7am, 10am, 1pm, 3pm, 7pm  
**Schedule File:** `/root/.openclaw/workspace/EMAIL_SCHEDULE.md`  
**Activation Script:** `/root/.openclaw/workspace/activate_email_checks.sh`  
**Status:** Cron setup pending (needs system approval)

**Rule:** Only alert Renata if email is from someone other than rphillippi@gmail.com

## AgentMail API Quick Reference

### Send Email
```bash
curl -X POST \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  "https://api.agentmail.to/v0/inboxes/efox@agentmail.to/messages/send" \
  -d '{
    "to": ["rphillippi@gmail.com"],
    "subject": "Hello!",
    "text": "Message body here"
  }'
```

### Check Inbox
```bash
curl -H "Authorization: Bearer $API_KEY" \
  "https://api.agentmail.to/v0/inboxes/efox@agentmail.to/messages"
```

### Key Operations
- Mark emails as read/unread
- Reply to emails with threading
- Label management (received, sent, read, unread, trash)

## Webhook Setup (Future)
For real-time notifications instead of polling:
- **LocalTunnel** - Easiest, no server needed
- **Render.com** - Free tier, sleeps after inactivity
- **Railway.app** - Free tier
- **Glitch.com** - Free, instant URL

## Notes
- Proton Mail was considered but AgentMail chosen for better API/automation support
- Privacy trade-off accepted for functionality
- Email is bidirectional (can send/reply, not just inbound)
