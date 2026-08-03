Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB92C55ABF
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2026 01:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D0610EC73;
	Wed,  5 Aug 2026 01:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W2LKC+Ng";
	dkim-atps=neutral
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5151610E5D0
 for <intel-gfx@lists.freedesktop.org>; Mon,  3 Aug 2026 16:36:05 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-84867f07d63so4231340b3a.2
 for <intel-gfx@lists.freedesktop.org>; Mon, 03 Aug 2026 09:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785774965; cv=none;
 d=google.com; s=arc-20260327;
 b=k6L/8NQF+SoJc/thKiZwt0M/LXzzyjCSNWwQASbyEF3uWkYCfTwZDAOqoptQzcO87x
 X62DkfGrFyn35DnTgrVLGwtREmgi+r1vBlmTBcYPZRwUfbUco4Pve3w+1JsPCaF7+6kU
 7HEJAHPChDxKuVRuP4+pUivHTSAczpfLgci/DeHdvfMuUutccNALb1fUayD+n5Gjr8hp
 jVaLs9BJFAC4Vca7WgfJttB1WkXvs7IOC5gki8E4MJSEokaALk+gGlh0UhP/QEEDLbFQ
 bmIo2A1d1ysjBBWLI6K0ye4EQxQt1kE6ZfyqFAzOMLprOMO4lQuZE4hQ0soF3DrNGS1N
 o/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=myGVdjpnSiL7NM+0ec6g/x7rV67iffaX94s+9kmlnUM=;
 fh=pOQMSRZbP0tQ4z19dYtu4mOzLUXPeLvqRpiGkgWvYqY=;
 b=poVBPEs8GYd06OfLE6aNmp6t2HTH147Ibd9FXH9ZsWJDQKPObNX7JqoQmZkd6AJpSS
 epy1b6gCDFatYcJMYqzLirtEAp4kM6lZZJukOmmHcHxw5BTbafhKZBxdQ4zHqppPBMXM
 pUuAdfIA2yOOpO0wlVCdSBudUCvGezK3uj24FmyGv9uyn66ejxO/mKEt70mQBoFWi475
 PJtpeK2e0UOeg5KooR5fXtQQnYR8dZGLrlzwrZPxtMhgDr/CdI+vw7tU68iDYa/yEE0V
 enl5nnY+XTIlR9xBPcEeCB5N7fEE5lKnj5e75wKku3bbHfXgZyFjRAZr1ENyG2C/mQFf
 Yk7Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785774965; x=1786379765; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=myGVdjpnSiL7NM+0ec6g/x7rV67iffaX94s+9kmlnUM=;
 b=W2LKC+NgO2WpLtGt6inhpA9+HRJjjlzmeL/8MIKqlB7N6ONWrXz3W68l6DcX2r3Jpd
 pY5zJcVtcsczTT5hAmNAP5P5Q0KWWKSrk9Gpq11uxt7anTW6q6hmKEuupBrYmwHqLGBB
 7tbHbEnCPAn3a6IsXDY47CAyjLBW+xyixHB2IcOE1sTspwXy6IjwCGifZNLYIlzxQ0eo
 WHuCu2JFbt+9OVhIsy8tU9Jics7I1xe+IkYd9cIs5v+L9+2Be31QvtWw+qoXIBK0Typ9
 DMwcLiTLbVMDXXpg9uZJRNlyudlMzbUCHoJwKnh7b8SY0I1G//Qtu5NiF1zXMtZ9tvwb
 OmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785774965; x=1786379765;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=myGVdjpnSiL7NM+0ec6g/x7rV67iffaX94s+9kmlnUM=;
 b=ay6UihJxALeIPl7f9ZBoKbsFh2PnTU8rRCZgef4bOYVHPmN2XtqwzyRwOl8lDKS+mi
 vXph4siwU5yEP++rzTWew8PU5ccR7KNZxkm9DaLW0pW7uU4maMCZs/S1G9j1yGXCd9jv
 n6cm0tCm9MgN8Gas06VYQ0mjaYgvu9yXBuzr28cDgj3Bk6UPzB508wQ88+ID5Lk1JOBb
 bLLxfRYrvD2ZulB0KnMVTRlKjK4gAbj1YXrtYgnFDRajbu2No109bIGXWQjTf/2XSS9K
 50PLETVxNSPpgFhxE0ZqhsEfLRYQQ/All8NyQ82z776FK/bTcInDc3vTQ5rIzzhO/E06
 1yVQ==
X-Gm-Message-State: AOJu0YwN97PaJFCxK3kMdAdMyeLMfgRxepH5G+bHw1G38AaThzhhOQUO
 onPmQlGEalWplH6aP4ezyFhfB8e5EOfeoYQFNh46TExXqTuvrBzbas64/3O2pKMsr1SeK1nqIF5
 WICo+a5n0+Dn9f8vbmfAkZdAGDKRkDs1JKUYUrG+yMQ==
X-Gm-Gg: AR+sD10hnbUJ/ooVf3bNlJCLtO/EVC8eEjgwhg8pOWJmG+/CEFuBth73yTpiHhhCFqJ
 BN9Gvm38pQJRY7SUgNAkoTJbHp3pLl3Bkg2Ji0MDmqqZ5vfRXi+1hV7yqciYpRRabiOSuyCW0ie
 YUli+xahnlDwO1TlAwU2IuLE5JFs1UwYYELouYQxArXumJt29pfD9uFR4+q8ydGsunVSiKCutPR
 8edFkKyRt4Z7IbHaChxF6+yF+2SixyTSPbZ4+46jC/6wcjRdK0Q7y6deWHSeeVImkThT+VdoeQ7
 95JZ8H/DM9sZvQ0p7AY0FSouFgSSovKv7cYfdTbhM7wtkKuyfGTsqT6hy6uifgnm4u53TjqW1d+
 iyydtwKeGIzJ9RqojKaFFI9VAyKcB2prYifqKK/dQjlIis36LbQ0avRZ3NAI=
X-Received: by 2002:a05:6a00:4b4b:b0:842:7296:dba with SMTP id
 d2e1a72fcca58-84ee47f5e85mr10382731b3a.7.1785774964728; Mon, 03 Aug 2026
 09:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <CACa-pC3Z6KN247yJ9tnb9BZoqSHmXWOzo4LyBodGbQj7uCN=CQ@mail.gmail.com>
 <40500b41434cf52b25d094fbfdcf56a782fd4607@intel.com>
In-Reply-To: <40500b41434cf52b25d094fbfdcf56a782fd4607@intel.com>
From: Parth Kamani <parthvipulkamani@gmail.com>
Date: Mon, 3 Aug 2026 20:40:30 +0530
X-Gm-Features: AUfX_mz9gUgc63Gyh-jB2YgZBj7vluSHD-jyi7ygsD8K3nCpJpgt6N97TUfgP9o
Message-ID: <CACa-pC2rUDWn343s9UMdhJC1BVFFFvAxmWS2KgzwnBbPYiia2A@mail.gmail.com>
Subject: Re: Offering to take a TODO item in i915
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: multipart/alternative; boundary="0000000000006be832065827225d"
X-Mailman-Approved-At: Wed, 05 Aug 2026 01:52:36 +0000
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

--0000000000006be832065827225d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jani,

Thank you for the explanation and for pointing me in the right direction.
That makes sense, and I appreciate the advice.

I'll shift my focus to the xe driver and the shared display code instead of
the older GEM/GT TODO items. I'll spend some time getting familiar with the
codebase and look for smaller issues that would make suitable first
contributions.

I also wanted to ask one additional question. I'm currently looking for a
paid internship or a student opportunity where I can contribute to Linux
kernel development while continuing to work upstream.

Would you happen to know of any teams, companies, or programs working on
the xe or DRM subsystem that are open to hiring or mentoring students? If
there's someone else I should reach out to, I'd be grateful for any
recommendations.

Thank you again for your guidance.

Best regards,

Parth Kamani
Final-year B.Tech Computer Engineering
K J Somaiya College of Engineering, Mumbai
Email: parthvipulkamani@gmail.com
Phone: +91 9820081318

On Mon, Aug 3, 2026 at 5:11=E2=80=AFPM Jani Nikula <jani.nikula@linux.intel=
.com>
wrote:

> On Mon, 03 Aug 2026, Parth Kamani <parthvipulkamani@gmail.com> wrote:
> > Hi Jani,
> >
> > I was looking through drivers/gpu/drm/i915/TODO.txt and noticed that
> there
> > are still a number of outstanding items. One that caught my attention
> was *"for
> > discrete memory manager, merge enough dg1 to be able to refactor it to
> ..."*.
> > I also saw items such as *"Come up with a plan what to do with
> > drm/scheduler and how to get there"* and *"Roll out dma_fence critical
> > section annotations"*, so it looks like there are several areas that
> still
> > need work.
> >
> > From the TODO, some of these items appear more involved than others, so
> > before I dive in I wanted to check with you. Is the discrete memory
> manager
> > item still something that would be appropriate to work on, or would you
> > recommend a different task for someone making a first contribution to
> i915?
> >
> > My preference is to keep patches small enough to review comfortably,
> > run checkpatch
> > --strict, test against current mainline, and submit them via git
> send-email.
> >
> > I'm currently in my final year of B.Tech in Computer Engineering at K J
> > Somaiya College of Engineering, Mumbai (graduating mid-2027), and I hav=
e
> a
> > meaningful amount of time to contribute before graduation. I'd much
> rather
> > spend that time contributing to a live upstream codebase than working
> only
> > on coursework. If there's a better first task than the TODO item above,
> I'd
> > really appreciate your recommendation and would be happy to work on tha=
t
> > instead.
>
> Thanks for your interest!
>
> The TODO was added in commit 6ab61ad5c1d8 ("drm/i915: add gem/gt TODO")
> and has barely been touched since. The primary reason is migrating to
> the xe driver for new platforms. If you're looking to work on a "live
> upstream codebase", seeking tasks in the xe driver, or the display
> driver under i915/display, shared between the xe and i915 drivers, is
> probably more rewarding.
>
>
> HTH,
> Jani.
>
>
> --
> Jani Nikula, Intel
>

--0000000000006be832065827225d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hi Jani,</p><p>Thank you for the explanation and for po=
inting me in the right direction. That makes sense, and I appreciate the ad=
vice.</p><p>I&#39;ll shift my focus to the xe driver and the shared display=
 code instead of the older GEM/GT TODO items. I&#39;ll spend some time gett=
ing familiar with the codebase and look for smaller issues that would make =
suitable first contributions.</p><p>I also wanted to ask one additional que=
stion. I&#39;m currently looking for a paid internship or a student opportu=
nity where I can contribute to Linux kernel development while continuing to=
 work upstream.</p><p>Would you happen to know of any teams, companies, or =
programs working on the xe or DRM subsystem that are open to hiring or ment=
oring students? If there&#39;s someone else I should reach out to, I&#39;d =
be grateful for any recommendations.</p><p>Thank you again for your guidanc=
e.</p><p>Best regards,</p><p>Parth Kamani<br>Final-year B.Tech Computer Eng=
ineering<br>K J Somaiya College of Engineering, Mumbai<br>Email: <a href=3D=
"mailto:parthvipulkamani@gmail.com">parthvipulkamani@gmail.com</a><br>Phone=
: +91 9820081318</p></div><br><div class=3D"gmail_quote gmail_quote_contain=
er"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 3, 2026 at 5:11=E2=80=
=AFPM Jani Nikula &lt;<a href=3D"mailto:jani.nikula@linux.intel.com">jani.n=
ikula@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Mon, 03 Aug 2026, Parth Kamani &lt;<a href=3D"mailt=
o:parthvipulkamani@gmail.com" target=3D"_blank">parthvipulkamani@gmail.com<=
/a>&gt; wrote:<br>
&gt; Hi Jani,<br>
&gt;<br>
&gt; I was looking through drivers/gpu/drm/i915/TODO.txt and noticed that t=
here<br>
&gt; are still a number of outstanding items. One that caught my attention =
was *&quot;for<br>
&gt; discrete memory manager, merge enough dg1 to be able to refactor it to=
 ...&quot;*.<br>
&gt; I also saw items such as *&quot;Come up with a plan what to do with<br=
>
&gt; drm/scheduler and how to get there&quot;* and *&quot;Roll out dma_fenc=
e critical<br>
&gt; section annotations&quot;*, so it looks like there are several areas t=
hat still<br>
&gt; need work.<br>
&gt;<br>
&gt; From the TODO, some of these items appear more involved than others, s=
o<br>
&gt; before I dive in I wanted to check with you. Is the discrete memory ma=
nager<br>
&gt; item still something that would be appropriate to work on, or would yo=
u<br>
&gt; recommend a different task for someone making a first contribution to =
i915?<br>
&gt;<br>
&gt; My preference is to keep patches small enough to review comfortably,<b=
r>
&gt; run checkpatch<br>
&gt; --strict, test against current mainline, and submit them via git send-=
email.<br>
&gt;<br>
&gt; I&#39;m currently in my final year of B.Tech in Computer Engineering a=
t K J<br>
&gt; Somaiya College of Engineering, Mumbai (graduating mid-2027), and I ha=
ve a<br>
&gt; meaningful amount of time to contribute before graduation. I&#39;d muc=
h rather<br>
&gt; spend that time contributing to a live upstream codebase than working =
only<br>
&gt; on coursework. If there&#39;s a better first task than the TODO item a=
bove, I&#39;d<br>
&gt; really appreciate your recommendation and would be happy to work on th=
at<br>
&gt; instead.<br>
<br>
Thanks for your interest!<br>
<br>
The TODO was added in commit 6ab61ad5c1d8 (&quot;drm/i915: add gem/gt TODO&=
quot;)<br>
and has barely been touched since. The primary reason is migrating to<br>
the xe driver for new platforms. If you&#39;re looking to work on a &quot;l=
ive<br>
upstream codebase&quot;, seeking tasks in the xe driver, or the display<br>
driver under i915/display, shared between the xe and i915 drivers, is<br>
probably more rewarding.<br>
<br>
<br>
HTH,<br>
Jani.<br>
<br>
<br>
-- <br>
Jani Nikula, Intel<br>
</blockquote></div>

--0000000000006be832065827225d--
