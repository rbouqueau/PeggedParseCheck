import pegged.peg;
import std.stdio;

bool check(const ref ParseTree p)
{
	if(!p.successful)
		return false;

	if(!checkBoundaries(p, 0, p.input.length))
		return false;

	return true;
}

private:
bool checkBoundaries(const ref ParseTree p, size_t begin, size_t end)
{
	if(p.begin != begin)
	{
		writeln("[Pegged] element not parsed:");
		writeln(p.input[begin .. p.begin]);
		return false;
	}

	if(p.end != end)
	{
		writeln("[Pegged] element not parsed:");
		writeln(p.input[end .. p.end]);
		return false;
	}

	return true;
}

