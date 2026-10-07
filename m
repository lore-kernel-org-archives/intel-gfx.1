Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699F7CA5FFC
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Oct 2026 14:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5C310F5FC;
	Wed,  7 Oct 2026 14:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="j0G4pVU4";
	dkim-atps=neutral
Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94D710EE39
 for <intel-gfx@lists.freedesktop.org>; Wed,  7 Oct 2026 11:49:05 +0000 (UTC)
Received: by mail-qk2-f8.google.com with SMTP id
 af79cd13be357-93e63db6681so157310885a.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 07 Oct 2026 04:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791373745;
 x=1791978545; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J6pQJGSlHCV+KnIWGdPCqLZH8QoWYjxr8wWq804sOu0=;
 b=j0G4pVU4jvxu6RN8G0+qkexThrcp32Zd0PmwulIwlZH1yoRWbto4rQ6Zq7RDz+qnEP
 7p7B1m1lf1g0p0cvMuPEoA+r/l52NpKtz0/jHHNLBJkDe6/20bxAibQ26sE+vI2k+kV8
 RAQTx6ENC9VbhtmB/z+8FeDWHdtYmmsNKr6wb2FV5Q6ymIfrUpVSBYBLjZ2Cs4Z4X5dF
 rjwiiTJ1HAfLL/3DzZ+6b3Qq4Zwv6HakQTQlKWEurWJOrwRLbd7uzvbOuYffzMJNPSnA
 Orc/iogSybm02i6sL4IRhgC9h29w1D9IrIh3i6a8wSN4cI1mPqJEH5wFtI6qTKfvWtLF
 eZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791373745; x=1791978545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J6pQJGSlHCV+KnIWGdPCqLZH8QoWYjxr8wWq804sOu0=;
 b=tVpcp029Mmi0y9RJHfkq9IRTFn4iKeJjmo9rfIHTMKkbRAdpjcaD6yLHRvUYVXEIrg
 PdxRPAOeq1EHJ1R5/vzaZKItpyVVPEmbBzPr6EG6L64qGcsfDHjlmtaWCJKZXTkib/Rz
 48ZKbJpX64qXWYlmfzQg3jqUI/cTszR30V31Vb+Gq8iQ728u7N5CG9Ktcm8wiiLtGa8K
 kEuSm3wTdhClZ+xgnmM9++EfD78jGmEI08nDACS1OboNB725j/gVdy6eVYVV82qZZovb
 AJ+fZi3XoVNhE7mhsR0muJe9PnbXRUp0sDIMpzLG55hvljswaPgS2OQMnia2FzWpbKem
 8Wvg==
X-Gm-Message-State: AFuF++nMRUXp3R6AeveBfkEsbapmNFe9O9dJef+z4bOt61bSrSFlreuh
 h7RCEdGEUyOzn/xpAymQfiUIqirOglFMpT4XIE7JkorH/CxhUu3/r3AjJSSoCmJbvB8=
X-Gm-Gg: AYBFou20n0CjQDU79es5j8BaY7aCmf4OPG5h2WF+gk9IvgYker6gbIHQOhkK1cAzzG3
 VLcKKsVbeXcdZ0GHQo/WIucUawMdAkqTW5W/zGLvIlfNbNkJ44QDP71JkSbpToFuzSC6r6izyME
 d1OduuLY7F1LTaBf5lTqyaGvWYcCO0fWxcozQ8sXl9/y11f+CGb6XcYtsOYdKEbK4j7HNfStWcA
 KBpvaqDLowiKfoU5PdE3Kr9PxZgODJq8+qkTknzNJIBdfoP/BzY7DqeTip0z1bSLK+B5WPFCdCa
 egxPqld45z5qfOlZydN+qg2q+3XRN/yVUpQymyEeod/UWy+qyUU3Nk0X9dVjLv4oJp1cFfVTuGd
 A+XFbkhw74t7SjUQEhrmzXU/uW/1Sud4uCrLgGGLRAvL07Wjfl66oCBDsjHg0uviE/SGhxFkTMD
 17Y2gL6z0xD2pRoVQgDnqBa7WyY2fvgw2/cyTIxxyzb1F4E5Py9sC+ognbdl9DWf6xl3Jai26Qb
 dHilvHhdUiBo6h5L63LQpEOhQ9tVsXywWAzO9jUKr9WkyjYMWeidbZ63lr7F8E3fLtXuwv4edK7
 l+S3wpDHOVrnPgO4qGdHUvq9J7JYoHFOwx8RyYZ801TlzyA7sAF6AgG5UD8eUgI=
X-Received: by 2002:a05:620a:270d:b0:939:5cd5:e243 with SMTP id
 af79cd13be357-93e9b30bbc0mr358052185a.6.1791373744740; 
 Wed, 07 Oct 2026 04:49:04 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93e991ef47bsm194216185a.42.2026.10.07.04.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 04:49:04 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH] drm/i915/dp: Don't promise AS SDPs in PR Active when they
 are disabled
Date: Wed,  7 Oct 2026 07:49:02 -0400
Message-ID: <20261007114902.2621201-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260923041342.2146450-1-j@metarealtyinc.ca>
References: <20260923041342.2146450-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 07 Oct 2026 14:06:25 +0000
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

Hi Jouni,

Thanks, that makes sense. Glad the AS SDP turned out to be the cause,
and the eDP 1.5 text explains why the driver got there. Your patch is
the right fix for the default.

AS SDP always on in PR Active is smooth here every time (tested as
PR_ALPM_CTL 0x01 with 0x107 0xc0, not with your exact patch). It does
cost DC5 on a static screen: 0 DC5 entries in 30 s on a static VT
against 550 with the AS SDP off in PR Active.

I have not measured the power yet. As an estimate: DC5/DC6 with the
screen on is what lets the package reach its deep idle states, so on
a static screen this could be worth roughly 5-15% of battery life in
mixed use. I can measure it against your patch if that helps.

This panel does run without the AS SDP. The RFC I sent keeps it on
while vblank is enabled and suspends it when idle; that has been
smooth here for over a week with DC5/DC6 intact.
https://lore.kernel.org/r/20261006220500.3417572-1-j@metarealtyinc.ca

Could that stay available on top of your patch for panels that handle
it, off by default? I can't prove it, but I would be surprised if Dell
and LG shipped this panel with that capability and Windows did not use
it for battery life. I can rebase the RFC onto your patch.

Separate issue, not solved by either: a few seconds of judder after
panel power-on. Locally I hold PR inactive for 8 s after power-on.

Thanks,
Jake
