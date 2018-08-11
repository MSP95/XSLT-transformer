import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;
class TransformXmlFile {
  public static void main(String[] args) throws Exception {
    String XSLFILE = args[0];
    String INFILE = args[1];
    String OUTFILE = args[2];
    System.setProperty("javax.xml.transform.TransformerFactory",
     "net.sf.saxon.TransformerFactoryImpl");

    StreamSource input = new StreamSource(new File(INFILE));
    StreamResult output = new StreamResult(new File(OUTFILE));
    StreamSource xslcode = new StreamSource(new File(XSLFILE));

    TransformerFactory tf = TransformerFactory.newInstance();
    Transformer trans = tf.newTransformer(xslcode);
    trans.transform(input, output);


  }
}
