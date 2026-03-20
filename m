Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4293F483C2
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Mar 2026 16:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5696310E5B7;
	Mon, 23 Mar 2026 16:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HgNFAUq0";
	dkim-atps=neutral
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4FB10EB00
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Mar 2026 18:15:51 +0000 (UTC)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-64caaacb9bcso1990679d50.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Mar 2026 11:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774030551; cv=none;
 d=google.com; s=arc-20240605;
 b=gg7xw8LXk2sXROwEB9WrgtmdsjOeMTVXNHcRlicW8eZMuY7miAZ2Xpluv9Ly0Dmuhv
 Fk1BR1PFEkolSgadApaWIMjV7J04sC9PRt9RSATQgexHO8pY/zEAPRDhSKmrkmPeUxgf
 8RPwQ0ZifXRcsPVcK6cicsDxSilg7J86VjNNJWEmXLRsLfLb1dMFS8ku06Oqj/yQy/Hc
 aP7TVZXAozbL0lQNGp6Mri+2P09XC8qkVC9dnxrSa0JCeVjktBfYyEk8TVb5e2xBszne
 eLpNqm7ex74l4uG5o8ShRZOdLHaZzDaOsk6rYYQQ8ihFAVlJNqzNptVDml2mqetF4RpY
 uB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=yqVOmyZ2Z9NpjvmKpf4W2/OoeWedoqj5iVulCJB7QGg=;
 fh=YUh96mzKrKT/nsQiFdVd7YJaKn/hr8ENXJAFdyT2nzo=;
 b=QtI/+7vwl2jlvjr44Mlz614ix5mtLyv4QXurv1O2cH7NEtl6G7sID3RjMxKzZU0sEs
 Oon8V1y5FG6GOlmMlcwKCVHkONOfjfvolykQ7nsLAIJEuJl9vIIs0dHW1tcdxZURqymy
 OR1K3NRJWxNuZkVSe4tt/9/zC9fbSfjcC4M6TIMRRnQ1pqv2xuoKbvhtRAI3qQRIEC34
 mV12SLvvsmwHBMQ+2r5CxxdDtvuqmtsiDD6r/kq5q4+YUYqKk8UKBNZaiCZwZG20gzaO
 jkPEynxx/1/p570pHEWsUNIerYr6bSs+9rJ4/mWDxMAW3Quf3/E5RvKC0ERgOK5njher
 OM9g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774030551; x=1774635351; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yqVOmyZ2Z9NpjvmKpf4W2/OoeWedoqj5iVulCJB7QGg=;
 b=HgNFAUq0Hgyiw4zqw3JgpV0k0nbDWJydu24VMfUWtYQna+PmQ6RaWNYT/uWn00NVAi
 soJwDvNOzhXjPxepn/j32sje7SpaG+PvCuTe82490IjW1mRurXGcEU2t1Tfx4bbY8bTv
 yObon8XLsqbwtWFCKC6z4IBMs2+zqYMHVrVfdm7JndzaopaWHlDf/2CgiOMS4XOJJ5+T
 aFJimKhyY9IcRVSx3fr37rzLUYzsk9QWoKU8PBLlts4rMODpi6S4L9clcKak8LddQf2l
 EhKypPRVIsoHOyncX80e9DgR/hdbxavjR1HXTZkguvE1e9h5O/zAy61uYwMfUM4W6g8m
 Mb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774030551; x=1774635351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yqVOmyZ2Z9NpjvmKpf4W2/OoeWedoqj5iVulCJB7QGg=;
 b=Fh4GEojtAzXnEEgIp2GzRWlH2en8TfNaHIqOMZVq2VIsZ53vb/Sc2pN/GWSXtrETf/
 FSBG4vlllAmrVxaXpRVN7tlENCqeqQrEl75Zb27DoKA0RqEnMeqEfWb3dTTiU4/8eTPj
 KgN1RyUUpgI+SXO3iKh93UJDu0RBOpqGJq09bx5hCZqej1EMQ+ZCiaSiqTRxSL/ZZUF3
 pkhPDPLN6fSrdzy2W1mSNkxyFckfreK/BQh8YWlJThsq/xx41D0gcoWcCfRgTi1UjnjV
 iJ0HzP/LqiyvYjuWTSkow7otztQWFI7kOa20mo7BMkQAgfennK/NdNCn6Cn1JIMZTVOp
 xwVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTCtzBEWMDhr/sK0BtU1tAm2h3w31it4HHz5lchRzwZTyy2pwv7BV9dTPuMoNAhuXnrsLUKKiabiA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+UQtoiKIAfNiQoDIy+A31p/Qi4/U/Z2WqHxNedA7IgNiIcyEd
 OdfLrsY5X2YZ5vx9OD456MklzJpBQhXdT6gHMjA5z7+In52vimcHrl+UqSZEIIW+LzduHdFlCeR
 py/9Phkwnw8dACXehlaMqAS9xnFvqFvM=
X-Gm-Gg: ATEYQzy72z90+PLIWZwvqlKO1+2UGjyem7dYFD2ZfpfFjgaWAO3vIZdot0KkNgRP+vN
 tLnNUfX6+/3P/2ZmT5WaMkt07wsJmIdsgZrR8smXiBUReo/GffDHEsbNZ5OyXumHQboe/NUb9XA
 ljZT7iv+aF73PixO/NlqslYW6lqswV2g3KHjR3fAWKEPM1i+nH7DYP19qGHdiotaSE1S64wWQwO
 Tx1mhxc1jSO2cyJQ4d0go7k07zak5NFSQr/vAHHO/zBirf9p4rynbT1J8SzLrw4ysZ/GMVZGC4b
 jTNO
X-Received: by 2002:a53:c052:0:10b0:64e:a220:295c with SMTP id
 956f58d0204a3-64eaa6de30amr3530515d50.23.1774030550487; Fri, 20 Mar 2026
 11:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
 <20260313132103.2529746-34-jim.cromie@gmail.com>
 <177402491455.6181.14143715499365255565.b4-review@b4>
In-Reply-To: <177402491455.6181.14143715499365255565.b4-review@b4>
From: jim.cromie@gmail.com
Date: Fri, 20 Mar 2026 12:15:24 -0600
X-Gm-Features: AaiRm50oHJtX5DOcrlwYqkPT1yywLsHi6Mo-IWiyIyjkVSYXdjkPbyeG6tTGqzc
Message-ID: <CAJfuBxxJBPxG9uYp2XrKF4952ika8AitSUq=ExT0N+_VZqKEAg@mail.gmail.com>
Subject: Re: [PATCH v11 33/65] docs/dyndbg: add classmap info to howto
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com, 
 gregkh@linuxfoundation.org, mripard@kernel.org, tzimmermann@suse.de, 
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, christian.koenig@amd.com, 
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com, 
 skhan@linuxfoundation.org, pmladek@suse.com, ukaszb@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 Mar 2026 16:03:24 +0000
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

On Fri, Mar 20, 2026 at 10:42=E2=80=AFAM Louis Chauvet
<louis.chauvet@bootlin.com> wrote:
>
> On Fri, 13 Mar 2026 07:19:58 -0600, Jim Cromie <jim.cromie@gmail.com> wro=
te:
> > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Docume=
ntation/admin-guide/dynamic-debug-howto.rst
> > index 0a42b9de55ac..734be0b5fe9a 100644
> > --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> > +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> > @@ -218,6 +211,25 @@ line
> > [ ... skip 13 lines ... ]
> > +
> > +.. note::
> > +
> > +    Unlike other keywords, classes are "name-to-change", not
> > +    "omitting-constraint-allows-change".  See Dynamic Debug Classmaps
> > +
>
> Why did you move the class description?
> Is there a way to add a link to _dyndbg-classmaps? (I don't know well the
> rst syntax)

I think I moved it to the bottom cuz its the latest keyword, and the
longest description.
(theyre not alphabetical, they could be, should they be ?)


>
> > @@ -395,3 +412,98 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``=
.
> > [ ... skip 45 lines ... ]
> > +DYNAMIC_DEBUG_CLASSMAP_DEFINE(clname,type,_base,classnames) - this map=
s
> > +classnames (a list of strings) onto class-ids consecutively, starting
> > +at _base.
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_USE(clname) & _USE_(clname,_base) - modules
> > +call this to refer to the var _DEFINEd elsewhere (and exported).
>
> (if you reorder the patches to merge the "basic" stuff, don't forget to
> move the _USE_ and offset explaination in a second documentation patch)
>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>
> --
> Louis Chauvet <louis.chauvet@bootlin.com>
