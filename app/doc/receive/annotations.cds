using wmappsrv as service from '../../../srv/services';

annotate service.Receive with @(
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'wmappsrv.PostReceive',
            Label : 'Post'
        },
    ]
);
