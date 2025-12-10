#!/bin/bash

# Bruno Collection Validation Script
# This script validates the Bruno collection structure

echo "🔍 Validating Bruno API Collection..."
echo ""

# Check for bruno.bru file
if [ -f "bruno.bru" ]; then
    echo "✅ Collection file (bruno.bru) found"
else
    echo "❌ Collection file (bruno.bru) missing"
    exit 1
fi

# Check environments
if [ -d "environments" ]; then
    echo "✅ Environments folder found"
    ENV_COUNT=$(find environments -name "*.bru" | wc -l | tr -d ' ')
    echo "   Found $ENV_COUNT environment(s)"
else
    echo "❌ Environments folder missing"
    exit 1
fi

# Count all .bru files
TOTAL_FILES=$(find . -name "*.bru" -not -path "./environments/*" -not -name "bruno.bru" | wc -l | tr -d ' ')
echo "✅ Found $TOTAL_FILES API request files"

# Check each folder
folders=("Auth" "Expenses" "Dashboard")
for folder in "${folders[@]}"; do
    if [ -d "$folder" ]; then
        COUNT=$(find "$folder" -name "*.bru" | wc -l | tr -d ' ')
        echo "   $folder: $COUNT requests"
    else
        echo "⚠️  Warning: $folder folder not found"
    fi
done

# Check health check files
HEALTH_FILES=$(find . -maxdepth 1 -name "Health*.bru" | wc -l | tr -d ' ')
echo "   Health checks: $HEALTH_FILES requests"

echo ""
echo "✨ Collection validation complete!"
echo ""
echo "📝 To use this collection:"
echo "   1. Install Bruno from https://www.usebruno.com/"
echo "   2. Open Bruno and click 'Open Collection'"
echo "   3. Select this directory: $(pwd)"
echo "   4. Start testing your APIs!"
