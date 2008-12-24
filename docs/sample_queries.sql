-- exploring relationships betweent tables
select sense.wordid, word.lemma,
synset.definition, sample.sample, categorydef.name,
sentenceref.sentenceid, sentencedef.sentence,
frameref.frameid, framedef.frame,
morphref.morphid, morphdef.lemma as morphdef_lemma,
casedword.lemma as casedword_lemma
from sense
inner join word on sense.wordid = word.wordid
left outer join  wordposition on sense.wordid = wordposition.wordid and sense.synsetid = wordposition.synsetid
inner join synset on sense.synsetid = synset.synsetid
left outer join sample on synset.synsetid = sample.synsetid
left outer join categorydef on synset.categoryid = categorydef.categoryid
left outer join casedword on sense.wordid = casedword.wordid
left outer join sentenceref on sense.synsetid = sentenceref.synsetid and sense.wordid = sentenceref.wordid
left outer join sentencedef on sentenceref.sentenceid = sentencedef.sentenceid
left outer join frameref on sense.synsetid = frameref.synsetid and sense.wordid = frameref.wordid
left outer join framedef on frameref.frameid = framedef.frame 
left outer join morphref on word.wordid = morphref.wordid
left outer join morphdef on morphref.morphid = morphdef.morphid
where word.lemma = 'love' and sense.rank = 2

-- hypernyms horse (n)
select se1.rank,w2.lemma
from word w1
left join sense se1 on w1.wordid = se1.wordid
left join synset sy1 on se1.synsetid = sy1.synsetid
left join semlinkref on sy1.synsetid = semlinkref.synset1id
left join synset sy2 on semlinkref.synset2id = sy2.synsetid
left join sense se2 on sy2.synsetid = se2.synsetid
left join word w2 on se2.wordid = w2.wordid
where w1.lemma = 'horse'
and sy1.pos = 'n'
and semlinkref.linkid = 1
order by se1.rank asc;

-- hyponyms horse (n)
select se1.rank,w2.lemma
from word w1
left join sense se1 on w1.wordid = se1.wordid
left join synset sy1 on se1.synsetid = sy1.synsetid
left join semlinkref on sy1.synsetid = semlinkref.synset1id
left join synset sy2 on semlinkref.synset2id = sy2.synsetid
left join sense se2 on sy2.synsetid = se2.synsetid
left join word w2 on se2.wordid = w2.wordid
where w1.lemma = 'horse'
and sy1.pos = 'n'
and semlinkref.linkid = 2
order by se1.rank asc;

-- get verbnet thematic roles for verb 'want'
select word.lemma,synset.synsetid,vnrole.rolesetid,vnroletype.type,vnselrestrs.selrestrs
from word
left join sense on word.wordid=sense.wordid
left join synset on sense.synsetid=synset.synsetid
left join vnrole on synset.synsetid=vnrole.synsetid and word.wordid=vnrole.wordid
left join vnroletype on vnrole.roletypeid=vnroletype.roletypeid
left join vnselrestrs on vnrole.selrestrsid=vnselrestrs.selrestrsid
where synset.pos='v' and word.lemma='want';

-- get xwordnet parses for verb 'want'
select word.lemma,synset.synsetid,xwnparselft.parse
from word
left join sense on word.wordid=sense.wordid
left join synset on sense.synsetid=synset.synsetid
left join xwnparselft on synset.synsetid=xwnparselft.synsetid
where synset.pos='v' and word.lemma='want';

-- get xwordnet lft for verb 'want'
select word.lemma,synset.synsetid,xwnparselft.lft
from word
left join sense on word.wordid=sense.wordid
left join synset on sense.synsetid=synset.synsetid
left join xwnparselft on synset.synsetid=xwnparselft.synsetid
where synset.pos='v' and word.lemma='want';

-- get xwordnet wsd for verb 'want'
select word.lemma,synset.synsetid,xwnwsd.wsd
from word
left join sense on word.wordid=sense.wordid
left join synset on sense.synsetid=synset.synsetid
left join xwnwsd on synset.synsetid=xwnwsd.synsetid
where synset.pos='v' and word.lemma='want';

-- get verbnet syntax/semantics for verb 'want'
select word.lemma,synset.synsetid,vnframeref.frameid,vnexampledef.example,vnframedef.syntax,vnframedef.semantics
from word
left join sense on word.wordid=sense.wordid
left join synset on sense.synsetid=synset.synsetid
left join vnframeref on synset.synsetid=vnframeref.synsetid and word.wordid=vnframeref.wordid
left join vnframedef on vnframeref.frameid=vnframedef.frameid
left join vnexampleref on vnframeref.frameid=vnexampleref.frameid
left join vnexampledef on vnexampleref.exampleid=vnexampledef.exampleid
where synset.pos='v' and word.lemma='want';

-- wordnet 2.0->3.0
select *
from legacy2030
where synsetid2=100124550;

--wordnet 3.0->2.0
select *
from legacy2030
where synsetid=100130045;

----wordnet 2.0->3.0 for 'want' from sensekey
select legacy2030.*,legacysensekey2030.sensekey
from legacysensekey2030
left join legacy2030 on legacy2030.mapid = legacysensekey2030.mapid
where legacysensekey2030.sensekey like 'want\%%';

--get synonyms for 'house' (all senses)
select synsetid, w2.lemma from sense
left join word as w2 on w2.wordid=sense.wordid
where sense.synsetid in
(
select sense.synsetid from word as w1
left join sense on w1.wordid=sense.wordid
where w1.lemma='house'
)
and w2.lemma<>'house';

--get synset offset of 'guide' in WordNet database files
select synsetid
from sense
left join word on word.wordid = sense.wordid
where word.lemma = 'guide';



