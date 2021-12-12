import org.antlr.v4.gui.TreeViewer;
import org.antlr.v4.gui.Trees;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.IOException;
import java.util.Arrays;

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
            ParseTree pythonParseTree = pParser.comment();

            System.out.println(pythonParseTree.toStringTree(pParser));

            TreeViewer pythonPTreeView = new TreeViewer(Arrays.asList(pParser.getRuleNames()), pythonParseTree);
            pythonPTreeView.open();


        }
        catch (IOException exception)
        {
            //Get Exception Information
            exception.printStackTrace();
        }

    }
}
