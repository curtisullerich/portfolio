#!/bin/bash
OLD="        <div id=\"footer\">Create a <a target=\"_top\" href=\"http:\/\/www.weebly.com\/\">free web site<\/a> with <a target=\"_top\" href=\"http:\/\/www.weebly.com\/\" title=\"free web site\">Weebly<\/a><\/div>"
NEW="        <div id=\"footer\">Template from <a target=\"_top\" href=\"http:\/\/www.weebly.com\/\">Weebly<\/a>, modifications by Curtis Ullerich<\/div>"
OLD2="	<div style='padding: 20px; width:100%; text-align:center;'>Create a <a target=\"_top\" href=\"http:\/\/www.weebly.com\/\">free web site<\/a> with <a target=\"_top\" href=\"http:\/\/www.weebly.com\/\" title=\"free web site\">Weebly<\/a><\/div>"
NEW2=""
for f in *.html
do
  sed -i "s/$OLD/$NEW/" $f
  sed -i "s/$OLD2/$NEW2/" $f
done
