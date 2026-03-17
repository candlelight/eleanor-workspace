# Email Check Schedule
# Timezone: PST (Pacific Standard Time)
# Only alerts if email is from someone other than Renata

## Check Times:
- 7:00 AM PST
- 10:00 AM PST
- 1:00 PM PST
- 3:00 PM PST
- 7:00 PM PST

## Manual Check Command:
```bash
/root/.openclaw/workspace/scripts/check_email.sh
```

## To Set Up Automated Checks:
Run this command to add to crontab:
```bash
crontab -e
```

Then add these lines:
```
# Eleanor Email Checks - PST Schedule
0 15,18,21,23,3 * * * /root/.openclaw/workspace/scripts/check_email.sh | grep -q "NEW EMAIL ALERT" && echo "📧 You have new email from someone else!" >> /tmp/email_alerts.log
```

## Notes:
- Converts to UTC: 3pm, 6pm, 9pm, 11pm, 3am UTC
- Only alerts for emails NOT from: rphillippi@gmail.com
- Checks up to 10 most recent messages
- Looks for 'unread' label to find new emails
