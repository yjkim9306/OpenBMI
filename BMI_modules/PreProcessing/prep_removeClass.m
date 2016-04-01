function [ out ] = prep_removeClass( dat, varargin )
%MRK_REMOVE_CLASS Summary of this function goes here
%   Detailed explanation goes here

if ~iscellstr(varargin)
    warning('check the class parameter, it shold be a string');
end

if ndims(dat.x)==2
    type='cnt';
elseif ndims(dat.x)==3
    type='epo';
end

rm_Class=varargin{:}
out=dat;
for i=1:length(rm_Class)
    n_c=~ismember(dat.y_class, varargin{i});
    if isfield(dat, 't')
        out.t=dat.t(n_c);
    end
    if isfield(dat, 'y_dec')
        out.y_dec=dat.y_dec(n_c);
    end
    if isfield(dat, 'y_logic')
        tm=~ismember(dat.class(:,2),rm_Class{i});
        out.y_logic=dat.y_logic(tm,:);
    end
    if isfield(dat, 'y_class')
        out.y_class=dat.y_class(n_c);
    end
    if isfield(dat, 'class')
        tm=~ismember(dat.class(:,2),rm_Class{i});
        out.class=dat.class(tm,:);
    end
end


end

