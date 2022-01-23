using wmappsrv as service from '../../../srv/services';

annotate service.Movement with @(
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'wmappsrv.PostMovement',
            Label : 'Post',
        }
    ]
);