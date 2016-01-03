#!/usr/bin/fish

echo "To install:"
echo "Addons > User Styles > Install from URLs"
echo ""

for css in *.css
    echo -n "file://"(realpath $css)" "
end

echo ""

