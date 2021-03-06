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

//Test case was swapping filter with project - was going wrong in mluber28.hql

EXPORT Standard__ssn :=
  RECORD
   string9 ssn;
  END;


namesRecord :=
            RECORD
string20        surname;
string10        forename;
Standard__ssn   ssn;
integer2        age := 25;
            END;

namesTable := dataset('x',namesRecord,xml);

namesRecord t(namesRecord l) := transform
    self.age := 1;
    self := l;
    end;

p := project(namesTable, t(LEFT));

output(p(ssn.ssn <> ''));
