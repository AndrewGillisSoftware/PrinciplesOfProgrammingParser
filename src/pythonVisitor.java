// Generated from C:/Users/Andre/Documents/GitHub/PrinciplesOfProgrammingParser/src\python.g4 by ANTLR 4.9.2
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link pythonParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface pythonVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link pythonParser#thing}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitThing(pythonParser.ThingContext ctx);
	/**
	 * Visit a parse tree produced by {@link pythonParser#comment}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitComment(pythonParser.CommentContext ctx);
	/**
	 * Visit a parse tree produced by {@link pythonParser#assignment}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssignment(pythonParser.AssignmentContext ctx);
}