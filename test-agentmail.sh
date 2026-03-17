#!/bin/bash
# AgentMail Test Script

export AGENTMAIL_API_KEY="am_us_pod_b2caffb0ada043a996d9e89d69f9a7e6c084278fe3793d15727675dffb8b4aa6"

echo "Testing AgentMail API..."
echo "========================"

# Test 1: List inboxes
echo -e "\n1. Listing inboxes:"
curl -s -H "Authorization: Bearer $AGENTMAIL_API_KEY" \
 "https://api.agentmail.to/v0/inboxes" | jq '.' 2>/dev/null || curl -s -H "Authorization: Bearer $AGENTMAIL_API_KEY" \
 "https://api.agentmail.to/v0/inboxes"

# Test 2: List messages from first inbox (if exists)
echo -e "\n2. Checking for messages..."
curl -s -H "Authorization: Bearer $AGENTMAIL_API_KEY" \
 "https://api.agentmail.to/v0/inboxes/eleanor@agentmail.to/messages" 2>/dev/null | jq '.' 2>/dev/null || echo "No eleanor@agentmail.to inbox yet"

echo -e "\n========================"
echo "Test complete!"
