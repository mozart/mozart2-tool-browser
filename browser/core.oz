%%%
%%% Authors:
%%%   Author's name (Author's email address)
%%%
%%% Contributors:
%%%   optional, Contributor's name (Contributor's email address)
%%%
%%% Copyright:
%%%   Organization or Person (Year(s))
%%%
%%% Last change:
%%%   $Date$ by $Author$
%%%   $Revision$
%%%
%%% This file is part of Mozart, an implementation
%%% of Oz 3
%%%    $MOZARTURL$
%%%
%%% See the file "LICENSE" or
%%%    $LICENSEURL$
%%% for information on usage and redistribution
%%% of this file, and for a DISCLAIMER OF ALL
%%% WARRANTIES.
%%%
%  Programming Systems Lab, University of Saarland,
%  Geb. 45, Postfach 15 11 50, D-66041 Saarbruecken.
%  Author: Konstantin Popov & Co.
%  (i.e. all people who make proposals, advices and other rats at all:))
%  Last modified: $Date$ by $Author$
%  Version: $Revision$

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%
%%%  (Oz)Machine-specific things like extra builtins, etc.
%%%
%%%
%%%

%%
%% ... to be used in 'reflect.oz' *only*;
fun {IntToAtom I}
   {String.toAtom {Int.toString I}}
end

%%
%% These are non-monotonic tests, that is, they never suspend.
%% Since we don't have job...end anymore, they actually must present
%% somewhere and somehow in Oz Kernel(?);
IsVar =        fun {$ X} {Value.isDet X} == false end
IsFdVar =      FDB.isVarB
IsRecordCVar = {`Builtin` 'recordCIsVarB' 2}

%%
%% Yields 'true' if a record given has a label already. Never
%% suspends;
HasLabel = {`Builtin` hasLabel 2}


EQ = {fun {$ X} X end System.eq}

%%
%% it takes three arguments - a term, depth and width has to be
%% walked through;
TermSize = {`Builtin` 'getTermSize' 4}

%%
%% Its argument is a term. It bounds its second argument to 'true'
%% when the first one gets ever touched. *It never suspends*.
%% It is useful for three purposes:
%% a) subsumes 'Det'
%% b) fires when the name of a variable is changed;
%% c) fires when a variable becomes an fd-variable or some other
%%    'kindof' variable;
GetsTouched = {`Builtin` getsBoundB 2}

%%
DeepFeed = {`Builtin` deepFeed 2}

%%
%% Yield arity/width of a chunk, suspend on variables,
%% or rise type errors;
ChunkArity = {`Builtin` 'chunkArity' 2}
ChunkWidth = {`Builtin` 'chunkWidth' 2}

%%
AddrOf = {`Builtin` 'addr' 2}

%%
OnToplevel = {`Builtin` 'onToplevel' 1}

%%
FSetGetGlb  = FSB.getGlb
FSetGetLub  = FSB.getLub
FSetGetCard = FSB.getCard
IsFSetVar   = FSB.isVarB

%%
GetCtVarNameAsAtom       = CTB.getNameAsAtom
GetCtVarConstraintAsAtom = CTB.getConstraintAsAtom
IsCtVar                  = CTB.isB


%%
ForeignPointerToInt = {`Builtin` 'ForeignPointerToInt' 2}
