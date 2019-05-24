#!/bin/bash
echo "<!DOCTYPE html>" > index.html

echo "" >> index.html

echo "<html lang=\"en\">" >> index.html

echo "" >> index.html

#head
echo "<head>" >> index.html

#Required meta tags
echo "<!-- Required meta tags always come first -->" >> index.html
echo "    <meta charset=\"utf-8\">" >> index.html
echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">" >> index.html
echo "    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">" >> index.html
#Required meta tags end

echo "" >> index.html

#Bootstrap CSS
echo "    <!-- Bootstrap CSS -->" >> index.html
echo "    <!-- build:css css/main.css -->" >> index.html
echo "    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">" >> index.html
echo "    <link rel=\"stylesheet\" href=\"css/styles.css\">" >> index.html
echo "    <!-- endbuild -->" >> index.html
#Bootstrap CSS end


#title
echo "    <title></title>" >> index.html

echo "</head>" >> index.html
#head end

echo "" >> index.html

#body
echo "<body>" >> index.html

#header
echo "<header>" >> index.html
echo "<h1>node_setup successfull</h1>" >> index.html
echo "</header>" >> index.html
#header end

echo "" >> index.html

#footer
echo "<footer>" >> index.html
echo "</footer>" >> index.html
#footer end

echo "" >> index.html

#
echo "    <!-- jQuery first, then Popper.js, then Bootstrap JS. -->" >> index.html
echo "    <!-- build:js js/main.js -->" >> index.html
echo "    <script src=\"node_modules/jquery/dist/jquery.slim.min.js\"></script>" >> index.html
echo "    <script src=\"node_modules/popper.js/dist/umd/popper.min.js\"></script>" >> index.html
echo "    <script src=\"node_modules/bootstrap/dist/js/bootstrap.min.js\"></script>" >> index.html
echo "    <script src=\"js/scripts.js\"></script>" >> index.html
echo "    <!-- endbuild -->" >> index.html

echo "</body>" >> index.html
#body end

echo "" >> index.html

echo "</html>" >> index.html
#DOC end

echo "" >> index.html
