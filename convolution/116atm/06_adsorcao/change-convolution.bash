#!/bin/bash

# This script substitutes placeholder strings in a template file
# with numerical values provided as command-line arguments,
# and saves the result to a new file.

TEMPLATE_FILE="fdmnes-restart.template"
OUTPUT_FILE="fdmnes-restart.in"

# Check if the template file exists
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file '$TEMPLATE_FILE' not found."
    exit 1
fi

# Check if the correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <GAMMAMAX_value> <ECENT_value> <ELARGE_value>"
    echo "Example: $0 0.5 10.0 50.0"
    exit 1
fi

# Assign command-line arguments to variables
gammamax_val="$1"
ecent_val="$2"
elarge_val="$3"

echo "This script will substitute the following placeholders in '$TEMPLATE_FILE':"
echo "GAMMAMAX with: $gammamax_val"
echo "ECENT with: $ecent_val"
echo "ELARGE with: $elarge_val"
echo ""
echo "Substituting values and saving to '$OUTPUT_FILE'..."

# Use sed to perform substitutions and redirect output to the new file.
# The original template file remains unchanged.
sed "s#GAMMAMAX#$gammamax_val#g; s#ECENT#$ecent_val#g; s#ELARGE#$elarge_val#g" "$TEMPLATE_FILE" > "$OUTPUT_FILE"

# Check if the output file was successfully created
if [ -f "$OUTPUT_FILE" ]; then
    echo "Substitution complete. Content saved to '$OUTPUT_FILE'."
else
    echo "Error: Failed to create '$OUTPUT_FILE'."
    exit 1
fi

