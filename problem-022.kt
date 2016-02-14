import java.io.File

fun main(args: Array<String>)
{
    val text = File("names.txt").readText()
    val sum = Regex("\"(.*?)\"")
            .findAll(text)
            .map { s -> s.value.removeSurrounding("\"") }
            .sorted()
            .mapIndexed { i, s -> (i + 1) * s.sumBy { c -> (c - 'A').toInt() + 1 }}
            .sum()
    print(sum)
}