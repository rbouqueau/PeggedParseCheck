import pegged.peg;
import std.stdio;

bool check(const ref ParseTree p)
{
	if(!p.successful)
		return false;

	if(!checkBoundaries(p, 0, p.input.length))
		return false;

	//if(!checkChildren(p))
	//	return false;

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

bool checkChildren(const ref ParseTree p)
{
	if(p.children.length == 0)
		return true;

	if(!checkBoundaries(p, p.children[0].begin, p.children[p.children.length - 1].end))
		return false;

	foreach(ref child; p.children)
	{
		if(!child.successful)
			return false;

		if(!checkChildren(child))
			return false;
	}

	return true;
}

