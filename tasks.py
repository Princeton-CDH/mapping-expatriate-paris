from  invoke import task
import glob


@task
def validate_xml(ctx, verbose=False):
    from lxml import etree

    errors = {}
    for section in ctx.xml_validation.keys():
        errors[section] = 0
        if verbose:
            print('\nXML validation (%s)' % section)

        section_cfg = ctx.xml_validation[section]
        # gather files based on paths in the config
        files = []
        for path in section_cfg['files']:
            files.extend(glob.glob(path))
        if not files:
            print('No files to process for %s' % section)
            continue
        # load configured schema
        schema = None
        if 'xsd' in section_cfg:
            xmlschema_doc = etree.parse(section_cfg['xsd'])
            schema = etree.XMLSchema(xmlschema_doc)
        # TODO: support other schema types here

        # NOTE: should be possible to support rnc
        # if rnc2rng is installed, but current getting an error
        # elif 'rnc' in section_cfg:
        #     with open(section_cfg['rnc']) as rncdoc:
        #        schema = etree.RelaxNG.from_rnc_string(rncdoc.read())

        elif 'schematron' in section_cfg:
            from lxml import isoschematron
            sct_doc = etree.parse(section_cfg['schematron'])
            schema = isoschematron.Schematron(sct_doc)


        if schema is None:
            print('No recognized schema format found for %s' % section)
            continue

        for file in files:
            xmldoc = etree.parse(file)
            if not schema.validate(xmldoc):
                print('Validation failed: %s' % file)
                errors[section] += 1
                # if verbose:
                # should errors only be displayed in verbose mode?
                print(schema.error_log)
            else:
                if verbose:
                    print('%s is valid' % file)


    # summarize any failures
    if any(errors.items()):
        print('')   # newline to distinguish from any error output
        for section, err_count in errors.items():
            if err_count:
                print('%s: %d file%s with errors' % (section, err_count,
                    '' if err_count == 1 else 's'))

        # if any file was invalid, exit with an error code to indicate
        # the build failed
        exit(-1)


