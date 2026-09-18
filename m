Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A38C982DD
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2026 19:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F28710E155;
	Fri, 18 Sep 2026 19:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JBwAGJnQ";
	dkim-atps=neutral
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B8610E999
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2026 19:37:15 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2db33db4de9so19925ad.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2026 12:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789760235; cv=none;
 d=google.com; s=arc-20260327;
 b=WL1Dcp+JB7tYumDlE68YzEKrHLdza/QKLut+LdHGnOHLR2Fi/OcfDfrIvRCFxUDiJR
 WhY5INyJDHPsI3RU7WJDCSBfdsvmGArcPRHQo75xuh8eU54zhjhjrfAFo2I5iVqZhL1Z
 zE0wc1icxtTg+TX8/N3gn59+/a1NtA8fYLytRdU9HXKRd/Maa/sjRLCjKAGvAlYgUOXb
 ocu62xfYeNeeNTDWqgKmR9BG3p0mUxGWTCeVFtganXZUh6d1YzOCJTlLzIw9m9UQLRYK
 V32OOAjISzRUHOkdAZWU4cuNS2Ykk+XBTfi6sL9FulfO/rvAqnSTtQCq6lIfDHMrgVZa
 fndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Br7cUCNooq3nxssmUkxnZhDdP7S1g9YDkn16ekfVBY4=;
 fh=q/w7coMY48kRJWwBY4MJHXVrhMMj2lrugdaL1sFroFs=;
 b=CV1lPOLB24E27+OPLINiBElhdODJ2JOIVbOqKV+B8XtuEPptCYTual4JoUn4KMZs80
 Un8gJtLLDOAsP5Ay/mciQhhu+4Z6T7aSWSufDzsnW0zDI1yxQ/UEoAmcNhShJrh7I3UJ
 hbiPsJ7+9Ite7jdpIWSJ8q1ddHn1ayRpqWe42uhFq6jpzjpzuyRKvrYeH1J9tz+EZCNu
 VPeIPTZH4YerTEk5k6x0NEjDkAyioAGNYE5Rckhq9kwtcKPA9OU/LwoE7gx+dn8gXDFn
 UYrnR60FCpcYhjrnGwIgklwvnpsn4TU873ooTrPYBw0D9YUJPaA+UTr5nUsJ5/JBGJ1T
 t6Qg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1789760235; x=1790365035;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Br7cUCNooq3nxssmUkxnZhDdP7S1g9YDkn16ekfVBY4=;
 b=JBwAGJnQmUPfwewIlZ/b8o8EN3U4OOQmxJyoOmwWRaJH4Fd1ikQY2ESr0zPAzBbuSW
 hXvx7jfrQahoxCRXv/GK0bhaeKG1Gw9hSdWBZ3jZFzl1hhZkw9zJe0nazfcZyBEzSkpO
 oFYL4XUrkMudu/sxl2aRgUuNXLzOCCDIQK7KxhZgXv+IxfvzJxH/qERxnd8Bcg4C8AR8
 VYqKd0/IAX5SIsLRlBXdlFQVMo3nGyQmekaI0plN8V+Vh7b5234ZMSrX1ZULMJc3hWA6
 komof3PSMqdWxmKXYhpY65UP+F+8VfPYr8rMwvRXx5oYOyp03pL3CQ7YIgXtzqtqQHvJ
 SM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789760235; x=1790365035;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Br7cUCNooq3nxssmUkxnZhDdP7S1g9YDkn16ekfVBY4=;
 b=ZTUS3CLnXxxI1SpHU4DNqqvGbWc01BWh/5h8hHVEobQVW5z1kkNzAos6bXTl5RXmnk
 dhCVL+8jfVlmrU4WpLhXvFI7m6ygUKlfnMnmvOAqm8MEKZxvBgCUTOgIp/UA4qKBDYST
 NT6nM7hs7x6VkGEkl4NuHyZTrhTkRz7gQUQjhasK9nMbdJqUwVZNXprMJz4Ty1LAvPvy
 ke3kt8RGsDKGXoFhFvH38Baa4+90x3QezYPIJe1rGTX3YI3Jb+e5h4LS9foCMcvtP7ez
 Soktb5VlHWBUdA/JJ6wkdmJM9vyL9qLUZY8lOsUPqqv3GWBZhG6AFrVkZehcgKm0jFTZ
 yPEA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxhQsQBxu7Z7g/qD6T8zuaDaNk93tD5JstUN4UuzqJrRidbuhNEaS4vzPs3ZbP10KdMwvkr6s5OB4c=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lGGuTjhWVnGH/1J2vHkbl4QBd9E/IH1+YVV9mxJWnfUwpGceYd
 jmjGKSoUuNn8nGTmenBu7f0EHiakIJFYyv7YW0Vh+IYd0+ugCckVN4mUEfI9ZlSGI2baBuliZeB
 nd9iUyKqGzfrEK1dXrzL6+WT4lTsQHLt7fYNke+Zj
X-Gm-Gg: AYBFou0CxLaFDAqQo/cqop7P9pySfC+tRcWJ61QH4ykO/SaNHEqn1bcmpyfR7f1UQMq
 QmNSpS+JiRUyDC+zQKo9exIjmPQ8+AdD3lDnPceaiU77Y/UwiYPyBQTiPkMey8Mi9w0DYa9W/7F
 N4yIt09qCHqF80CTx8+4e2+q5FQYtAadEz/RxEPLq3Xw3q9tUOUky4BImb7glekehEp6cbFPfRI
 pyi0F2YPWu8HoixlF1FTEo3MX2MDybOMBkQ8i8w9rNCAzt6GpcCs+267E9YJocHiKhLECuVh8IJ
 1NAQUJ4X0zBn8BjGRuWCV8ge5NcSlm6IwpoicPPsrDt/JIthLcOzOlaQ
X-Received: by 2002:a17:903:1848:b0:2c7:f688:f22f with SMTP id
 d9443c01a7336-2ddc1789cfcmr1507255ad.13.1789760234370; Fri, 18 Sep 2026
 12:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260601212613.3682640-1-jdsultan@google.com>
 <20260602205422.1792007-1-jdsultan@google.com>
 <68143a59-ca3f-4e57-997a-8342021ffd53@intel.com>
In-Reply-To: <68143a59-ca3f-4e57-997a-8342021ffd53@intel.com>
From: Gil Dekel <gildekel@google.com>
Date: Fri, 18 Sep 2026 15:37:03 -0400
X-Gm-Features: AcwNN1XsmICsqpkOrWKs9KpU0y7yXiZm3L_7TgmUVHsYOnPHBfLQJ_3SM2KmsQA
Message-ID: <CA++eeRM5PbFq79Yw9xECRaat_Ju759Xrc_7=F-R1viCsLFREfg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/i915/dp: Handle VSC SDP revision 7 in unpack
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: Juasheem Sultan <jdsultan@google.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000001a8ca065bc7072a"
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--00000000000001a8ca065bc7072a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,
If I'm reading this correctly, it seems like this patch was LGTMd but
hasn't been merged yet.
We would really like to pull this patch into our kernels as it is the
source of a lot of log spam around seamless modesets.

Is there a reason this hasn't been merged yet?
Thank you in advance.

Sincerely,

On Wed, Jun 3, 2026 at 7:40=E2=80=AFAM Borah, Chaitanya Kumar <
chaitanya.kumar.borah@intel.com> wrote:

> On 6/3/2026 2:24 AM, Juasheem Sultan wrote:
> > VSC SDP revision 7 (Panel Replay + Pixel Encoding/Colorimetry Format)
> > unpacking is missing in intel_dp_vsc_sdp_unpack(). This causes pipe
> > state mismatches during state readout because the VSC SDP state is not
> > properly recovered when Panel Replay is active with colorimetry.
> >
> > Add the missing case for revision 7 to intel_dp_vsc_sdp_unpack()
> > so that the state is correctly recovered.
> >
> > v2: Rebase onto latest upstream
> > v3: Fix git commit description
> >
>
> LGTM.
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Chaitanya Borah <chaitanya.kumar.borah@intel.com>
> > Cc: Gil Dekel <gildekel@google.com>
> > Signed-off-by: Juasheem Sultan <jdsultan@google.com>
> > ---
> >   drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 6ef2a0043cda..b8746dab051c 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -5343,11 +5343,15 @@ static int intel_dp_vsc_sdp_unpack(struct
> drm_dp_vsc_sdp *vsc,
> >                *   VSC SDP supporting 3D stereo + Panel Replay.
> >                */
> >               return 0;
> > -     } else if (sdp->sdp_header.HB2 =3D=3D 0x5 && sdp->sdp_header.HB3 =
=3D=3D
> 0x13) {
> > +     } else if ((sdp->sdp_header.HB2 =3D=3D 0x5 || sdp->sdp_header.HB2=
 =3D=3D
> 0x7) &&
> > +                     sdp->sdp_header.HB3 =3D=3D 0x13) {
> >               /*
> >                * - HB2 =3D 0x5, HB3 =3D 0x13
> >                *   VSC SDP supporting 3D stereo + PSR2 + Pixel
> Encoding/Colorimetry
> >                *   Format.
> > +              * - HB2 =3D 0x7, HB3 =3D 0x13
> > +              *   VSC SDP supporting 3D stereo + Panel Replay + Pixel
> Encoding/Colorimetry
> > +              *   Format.
> >                */
> >               vsc->pixelformat =3D (sdp->db[16] >> 4) & 0xf;
> >               vsc->colorimetry =3D sdp->db[16] & 0xf;
>
>

--=20

Gil Dekel
*AluminiumOS*
Desktop Experience
Laptop & Tablets Display

Software Engineer
gildekel@google.com
+1 (650) 861-2933

--00000000000001a8ca065bc7072a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi all,<div>If I&#39;m reading this corre=
ctly, it seems like this patch was LGTMd but hasn&#39;t been merged yet.</d=
iv><div>We would really like to pull this patch into our kernels as it is t=
he source of a lot of log spam around seamless modesets.</div><div><br></di=
v><div>Is there a reason this hasn&#39;t been merged yet?</div><div>Thank y=
ou in advance.</div><div><br></div><div>Sincerely,</div><div><br></div></di=
v><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jun 3, 2026 at 7:40=E2=80=AFAM Borah, Chaitanya Kum=
ar &lt;<a href=3D"mailto:chaitanya.kumar.borah@intel.com">chaitanya.kumar.b=
orah@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On 6/3/2026 2:24 AM, Juasheem Sultan wrote:<br>
&gt; VSC SDP revision 7 (Panel Replay + Pixel Encoding/Colorimetry Format)<=
br>
&gt; unpacking is missing in intel_dp_vsc_sdp_unpack(). This causes pipe<br=
>
&gt; state mismatches during state readout because the VSC SDP state is not=
<br>
&gt; properly recovered when Panel Replay is active with colorimetry.<br>
&gt; <br>
&gt; Add the missing case for revision 7 to intel_dp_vsc_sdp_unpack()<br>
&gt; so that the state is correctly recovered.<br>
&gt; <br>
&gt; v2: Rebase onto latest upstream<br>
&gt; v3: Fix git commit description<br>
&gt; <br>
<br>
LGTM.<br>
Reviewed-by: Chaitanya Kumar Borah &lt;<a href=3D"mailto:chaitanya.kumar.bo=
rah@intel.com" target=3D"_blank">chaitanya.kumar.borah@intel.com</a>&gt;<br=
>
<br>
&gt; Cc: Jani Nikula &lt;<a href=3D"mailto:jani.nikula@linux.intel.com" tar=
get=3D"_blank">jani.nikula@linux.intel.com</a>&gt;<br>
&gt; Cc: Chaitanya Borah &lt;<a href=3D"mailto:chaitanya.kumar.borah@intel.=
com" target=3D"_blank">chaitanya.kumar.borah@intel.com</a>&gt;<br>
&gt; Cc: Gil Dekel &lt;<a href=3D"mailto:gildekel@google.com" target=3D"_bl=
ank">gildekel@google.com</a>&gt;<br>
&gt; Signed-off-by: Juasheem Sultan &lt;<a href=3D"mailto:jdsultan@google.c=
om" target=3D"_blank">jdsultan@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm=
/i915/display/intel_dp.c<br>
&gt; index 6ef2a0043cda..b8746dab051c 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_dp.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_dp.c<br>
&gt; @@ -5343,11 +5343,15 @@ static int intel_dp_vsc_sdp_unpack(struct drm_=
dp_vsc_sdp *vsc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0V=
SC SDP supporting 3D stereo + Panel Replay.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else if (sdp-&gt;sdp_header.HB2 =3D=3D 0x5 &amp=
;&amp; sdp-&gt;sdp_header.HB3 =3D=3D 0x13) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if ((sdp-&gt;sdp_header.HB2 =3D=3D 0x5 || =
sdp-&gt;sdp_header.HB2 =3D=3D 0x7) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sdp-&gt;sdp_header.HB3 =3D=3D 0x13) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * - HB2 =3D 0x5=
, HB3 =3D 0x13<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0V=
SC SDP supporting 3D stereo + PSR2 + Pixel Encoding/Colorimetry<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0F=
ormat.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * - HB2 =3D 0x7, HB3=
 =3D 0x13<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0VSC SD=
P supporting 3D stereo + Panel Replay + Pixel Encoding/Colorimetry<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0Format=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vsc-&gt;pixelfor=
mat =3D (sdp-&gt;db[16] &gt;&gt; 4) &amp; 0xf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vsc-&gt;colorime=
try =3D sdp-&gt;db[16] &amp; 0xf;<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><table width=3D"90%" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0" style=3D"margin:0px;padding:0px;max-width:348px"><tbo=
dy style=3D"margin:0px;padding:0px"><tr style=3D"margin:0px;padding:0px"><t=
d style=3D"padding:0px 0px 5px;font-family:Arial,Helvetica,Verdana,sans-ser=
if;font-size:13px;line-height:15px;color:rgb(153,153,153)"></td></tr><tr st=
yle=3D"margin:0px;padding:0px"><td style=3D"padding:0px"><table border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin:0px;padding:20px 0px =
0px"><tbody style=3D"margin:0px;padding:0px"><tr style=3D"margin:0px;paddin=
g:0px"><td valign=3D"top" style=3D"padding:0px 20px 0px 0px;vertical-align:=
top;border-right:1px solid rgb(213,213,213)"><img src=3D"https://www.google=
.com/logos/doodles/2015/inge-lehmanns-127th-birthday-5712482031108096.2-hp2=
x.gif" width=3D"200" height=3D"87"><br></td><td style=3D"padding:0px 0px 0p=
x 20px"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"ma=
rgin:0px;padding:0px"><tbody style=3D"margin:0px;padding:0px"><tr style=3D"=
margin:0px;padding:0px"><td colspan=3D"2" style=3D"padding:1px 0px 5px;font=
-family:Arial,Helvetica,Verdana,sans-serif;font-size:13px;line-height:13px;=
color:rgb(56,58,53);font-weight:700">Gil Dekel<br></td></tr><tr style=3D"ma=
rgin:0px;padding:0px"><td colspan=3D"2" style=3D"padding:0px 0px 5px;line-h=
eight:13px"><font style=3D"font-family:Arial,Helvetica,Verdana,sans-serif;f=
ont-size:11px"><font color=3D"#666666"><b>AluminiumOS</b></font><br><font c=
olor=3D"#383a35">Desktop Experience</font><br><font color=3D"#383a35">Lapto=
p &amp; Tablets Display</font><br></font><font face=3D"Arial, Helvetica, Ve=
rdana, sans-serif"><span style=3D"font-size:11px">=C2=A0</span></font><br><=
font color=3D"#999999" style=3D"font-family:Arial,Helvetica,Verdana,sans-se=
rif;font-size:11px">Software Engineer</font></td></tr><tr style=3D"margin:0=
px;padding:0px"><td colspan=3D"2" style=3D"padding:0px 0px 5px;font-family:=
Arial,Helvetica,Verdana,sans-serif;font-size:11px;line-height:13px;color:rg=
b(56,58,53)"><a href=3D"mailto:gildekel@google.com" target=3D"_blank">gilde=
kel@google.com</a></td></tr><tr style=3D"margin:0px;padding:0px"><td colspa=
n=3D"2" style=3D"padding:0px 0px 3px;font-family:Arial,Helvetica,Verdana,sa=
ns-serif;font-size:11px;line-height:13px;color:rgb(3,112,248)">+1 (650) 861=
-2933</td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody>=
</table></div></div></div>

--00000000000001a8ca065bc7072a--
