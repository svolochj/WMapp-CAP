using wmappsrv as service from '../../../srv/services';

annotate service.Issue with @(
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'wmappsrv.PostIssue',
            Label : 'Post'
        }
    ]
);