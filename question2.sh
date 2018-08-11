#!/bin/bash

echo "Compiling transform.java..."
if javac -cp ".:lib/*" transform.java;
then
   echo "Compilation successful! Now Running the transformer..."
   if java -cp ".:lib/*" TransformXmlFile websiteXml2Html.xsl website.xml website.html;
   then
     echo "$(tput setaf 2)"
     echo "Transformation of website.xml to website.html Successfull!"
     echo "Please check the generated file : website.html"
     echo "$(tput sgr 0)"
   fi
fi
