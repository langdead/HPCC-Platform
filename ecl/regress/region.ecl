/*##############################################################################

    HPCC SYSTEMS software Copyright (C) 2012 HPCC Systems.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
############################################################################## */

#option ('importAllModules', true);

#region namesRecord definition
namesRecord :=
            RECORD
string20        surname;
string10        forename;
integer2        age := 25;
            END;
#endregion

#region
namesTable := dataset('x',namesRecord,FLAT);
#endregion

namesTable2 := dataset([
        {'Hawthorn','Gavin',31},
        {'Hawthorn','Mia',30},
        {'Smithe','Pru',10},
        {'X','Z'}], namesRecord);

#region This is the main processing code
output(nofold(namesTable2)(surname[1] in ['0','1','3']),,'out.d00',overwrite);
#endregion