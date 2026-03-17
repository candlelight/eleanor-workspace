#!/bin/bash
# Run this script to activate Eleanor's email checking schedule

echo "Setting up email check cron jobs..."

# Get current crontab or create new one
crontab -l 2>/dev/null > /tmp/cron_tmp || echo "# New crontab" > /tmp/cron_tmp

# Add Eleanor's email check schedule
cat >> /tmp/cron_tmp << 'EOF'

# Eleanor Email Checks - PST Schedule
# 7am PST (3pm UTC), 10am PST (6pm UTC), 1pm PST (9pm UTC), 3pm PST (11pm UTC), 7pm PST (3am UTC)
0 15,18,21,23,3 * * * /root/.openclaw/workspace/scripts/check_email.sh | grep -q "NEW EMAIL ALERT" && echo "📧 You have new email!" >> /tmp/email_alert.log
EOF

# Install the new crontab
crontab /tmp/cron_tmp

# Verify
echo ""
echo "✅ Cron jobs installed!"
echo ""
echo "Current crontab:"
crontab -l
