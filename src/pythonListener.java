// Generated from C:/Users/Andre/Documents/GitHub/PrinciplesOfProgrammingParser/src\python.g4 by ANTLR 4.9.2
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link pythonParser}.
 */
public interface pythonListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link pythonParser#thing}.
	 * @param ctx the parse tree
	 */
	void enterThing(pythonParser.ThingContext ctx);
	/**
	 * Exit a parse tree produced by {@link pythonParser#thing}.
	 * @param ctx the parse tree
	 */
	void exitThing(pythonParser.ThingContext ctx);
	/**
	 * Enter a parse tree produced by {@link pythonParser#comment}.
	 * @param ctx the parse tree
	 */
	void enterComment(pythonParser.CommentContext ctx);
	/**
	 * Exit a parse tree produced by {@link pythonParser#comment}.
	 * @param ctx the parse tree
	 */
	void exitComment(pythonParser.CommentContext ctx);
	/**
	 * Enter a parse tree produced by {@link pythonParser#assignment}.
	 * @param ctx the parse tree
	 */
	void enterAssignment(pythonParser.AssignmentContext ctx);
	/**
	 * Exit a parse tree produced by {@link pythonParser#assignment}.
	 * @param ctx the parse tree
	 */
	void exitAssignment(pythonParser.AssignmentContext ctx);
}