# Email Configuration

**Provider:** AgentMail
**Email:** efox@agentmail.to
**Status:** ✅ FULLY OPERATIONAL

## API Access
**API Key:** `am_us_pod_b2caffb0ada043a996d9e89d69f9a7e6c084278fe3793d15727675dffb8b4aa6`  
**Stored in:** `/root/.openclaw/workspace/send_reply.sh`

## Capabilities
- ✅ Send emails
- ✅ Receive emails  
- ✅ Reply to threads

## Scripts
| Script | Purpose |
|--------|---------|
| `send_reply.sh` | Send emails and replies |
| `scripts/check_email.sh` | Check inbox for new messages |
| `test-agentmail.sh` | Test connectivity |
| `activate_email_checks.sh` | Set up cron automation |

## Automation Schedule
**Check Times (PST):** 7am, 10am, 1pm, 3pm, 7pm  
**Status:** Scripts ready, cron activation pending approval

**Alert Rule:** Only notify Renata if email is NOT from rphillippi@gmail.com

## Integration Status
- [x] Account created
- [x] API key configured
- [x] Send functionality tested
- [x] Receive functionality tested
- [x] Reply functionality tested
- [ ] Webhook setup for real-time notifications (future)
- [ ] Cron automation activated (pending approval)

## Notes
- Account created via AgentMail (agentmail.to)
- Preferred over Proton Mail for API/webhook capabilities
- Privacy trade-off accepted for automation functionality
