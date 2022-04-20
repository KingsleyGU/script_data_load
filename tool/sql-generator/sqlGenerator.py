import argparse
import csv
import sqlTemplates
import sys
from pathlib import Path

def read_table_map(file):
    with open(file, mode='r') as f:
        reader = csv.reader(f, delimiter=';')
        return {rows[0]: rows[1] for rows in reader}


def read_column_map(file):
    with open(file, mode='r') as f:
        reader = csv.reader(f, delimiter=';')
        return {(rows[0], rows[1]): [rows[2], rows[3], rows[4], rows[5]] for rows in reader}


def read_csv_header(file):
    with open(file, newline='') as csvfile:
        reader = csv.reader(csvfile, delimiter=';')
        return next(reader)


def build_type(key, map):
    try:
        type_info = map[(key)]
        if type_info[0] == 'DATE':
            return (type_info[0])
        else:
            return (type_info[0] if 'CHAR' not in type_info[0] else 'VARCHAR2') + '(' + (type_info[3] + ' CHAR' if 'CHAR' in type_info[0] else (type_info[2] + ',' + type_info[1])) + ')'
    except KeyError:
        print("Cannot find field {0}".format(key))
        return "TBD"


def check_date(key, map):
    try:
        type_info = map[(key)]
        if type_info[0] == 'DATE':
            return ' CHAR date_format DATE MASK "DD/MM/YY"'
        else:
            return ''
    except KeyError:
        print("Cannot find field {0}".format(key))
        return "TBD"

        
def generate_sql(args, file):
    fields = read_csv_header(file)
    Path(args.output_folder + '\\').mkdir(parents=True, exist_ok=True) 
    csvname = file.name
    sql = open(str(Path(args.output_folder)) + '\\'  + '\\' + csvname + '_create.sql','w')
    table_map = read_table_map(args.table_map)
    table_name = table_map[csvname]
    column_map = read_column_map(args.column_map)
    fields = [''.join('M_' + item) for item in fields]
    line=(', \n'.join('"' + item + '" ' + build_type((table_name, item), column_map) for item in fields))
    sql.write(sqlTemplates.templates["create"]["header"].format(table=table_map[csvname], fields=line))
    line = (', \n'.join(item + check_date((table_name, item), column_map) for item in fields))
    sql.write(sqlTemplates.templates["create"]["body"].format(folder=args.dir, fields=line, table=table_map[csvname]))
    sql.write(sqlTemplates.templates["create"]["footer"].format(csv=csvname))
    sql.close()
    
    #sql = open(str(Path(args.output_folder)) + '\\'  + csvname + '_insert.sql','w')
    #line=(', \n'.join(item for item in fields))
    #sql.write(sqlTemplates.templates["insert"]["header"].format(table=table_map[csvname],ext=args.ext, fields=line))
    #sql.write(sqlTemplates.templates["insert"]["body"].format(table=table_map[csvname],ext=args.ext, fields=line))
    #sql.write(sqlTemplates.templates["insert"]["footer"].format(table=table_map[csvname],ext=args.ext, fields=line))
    #sql.close()
    

def main():
    parser = argparse.ArgumentParser(prog=sys.argv[0].split('.')[0],
                                     description='Generates SQL for loading files into TWH.',
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)

    parser.add_argument('table_map', help='Name of the table map file (CSV).')
    parser.add_argument('column_map', help='Name of the column map file (CSV).')
    parser.add_argument('dir', help='Name of the Oracle source directory.')
    parser.add_argument('ext', help='Target table testing extension (use '' for none).')
    parser.add_argument('input_folder', help='Input folder or file.', default='')
    parser.add_argument('output_folder', help='Output folder.', default='')

    args = parser.parse_args()
    
    p = Path(args.input_folder)
    if not p.is_dir():
        generate_sql(args, p)
    else:
        [generate_sql(args, f) for f in p.glob('*.csv')]
    

if __name__ == '__main__':
    main()
