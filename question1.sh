#!/bin/bash

echo "Compiling transform.java..."
if javac -cp ".:lib/*" transform.java;
then
   echo "Compilation successful! Now Running the transformer..."
   if java -cp ".:lib/*" TransformXmlFile site2website.xsl site.xml website.xml;
   then
     echo "$(tput setaf 2)"
     echo "Transformation of site.xml to website.xml Successfull!"
     echo "Please check the generated file : website.xml"
     echo "$(tput sgr 0)"
   fi
fi
