import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.IOException;

public class start {

    public static void main(String[] args) {
        String fileName = "python_test_code.py";

        //Catch a File Error
        try
        {
            CharStream stream = CharStreams.fromFileName(fileName);
            pythonLexer pLexer = new pythonLexer(stream);
            CommonTokenStream tokenStream = new CommonTokenStream(pLexer);
            pythonParser pParser = new pythonParser(tokenStream);
            ParseTree pythonParseTree = pParser.prule();

            pythonVisitor pythonVisitor = new pythonBaseVisitor();
            pythonVisitor.visit(pythonParseTree);
        }
        catch (IOException exception)
        {
            //Get Exception Information
            exception.printStackTrace();
        }

    }
}
