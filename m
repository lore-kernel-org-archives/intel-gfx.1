Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB4DC98331
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2026 19:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A66E10FC35;
	Fri, 25 Sep 2026 19:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VFiRMOY2";
	dkim-atps=neutral
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com
 [74.125.225.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0864F10E54F
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Sep 2026 16:26:05 +0000 (UTC)
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d391aso173215e9.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Sep 2026 09:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790267163; x=1790871963; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TKqbDfmVx8XOcuUP5vdlZRzhi46G+tOuyrF2LCLjHaM=;
 b=VFiRMOY2uafqwrAUsssJw6h9P3MojH2J836++cvqIw0M4S/c8jBa9DUkP9qJdm6WFN
 iMulqwLKeePYku/TsvRBOPrQT3H9fNEo+EV1dtIHWfmLCE8c9MWxGs0C8TtgwEMqKDmS
 pASt557CaPM1TzcjX/cxaaa9W286GHZUZRXz/VsodIXssYWgIEp3I0N/Usk2p0ksEBGi
 t497hbsMasluCFLhHaoDC4hJFmTtZy+13HWjoW6BubrB7/DA2UO6zKnam+plPwO6o8Z4
 Neeb8VCHvMzhFtulaxU3p6nT2ly6StTLK9UKVlxeFAcSUe03ten/05ETosTA8vNtmiwW
 PSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790267163; x=1790871963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TKqbDfmVx8XOcuUP5vdlZRzhi46G+tOuyrF2LCLjHaM=;
 b=J3OObWx2x5OTCitHVxm+iiSYSExcygMMjQyM9xqzNVmQu2z0xblzst1EDHHbxsbVla
 6hmi766K5OmQ1s7lpKkqknAEaLBXzUDbI5gASlt1oEb3RKBnH0EUpXQ9Kf7e2/fhu4iW
 i5CmYOCTohpR2BpgWVyu3/dabJWAXw3BUh69RL7PPIR+dA7zOimpMYsBX58LIKoSZu5O
 Ixg7g0iHKXiVUMaWAkGqokzI73MpB6sfnvoAfgEAPXMuuHXUb+GlNM81KTKDBAT5HPA4
 nno3z3Gc98/DrN1P2sd1S+8mGAjLiZDzqOuR8yRD2pmXvaHUQjOsPV7pjf/BsG3HqTNf
 sG2A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxf5ECxhHHSeiQcxjR5pro/KrtGKlqjPlKnYZu5LaAPneFyr4yC1Q/+5AgDrKWf/pqZC7f02b0LIOs=@lists.freedesktop.org
X-Gm-Message-State: AFuF++mMe2wRK7VvPrDjHIpSTcBNgz86l65+BUWms06UCOFUMV8LA5xn
 aXO+1ElEdtzyXDCHnUPbnO8ZTy6h1l0pxdWZeh0ddIjppzdG1qxx7syo
X-Gm-Gg: AYBFou34nKudWUbJdzNJ6WBzP0oHxOW5CK8uWKu03zA0Hsucln43RA23tZ+0apqujJX
 EZohHBzm1+uK6bm/3sFW3DvX9hpgg3TulVfpthIMqknQiHdqSa/q3kV5IP8H1MgLKsx3n2jeDat
 33+HgHREHvYC30I2nwK+vP8jYnCM+79RCutuz8z62INCBcUW83PPnDar67A+G9KceCYtTqZWEJB
 fkgfAnC78/geliSTuzSbegL0Mp988G+xjO5ikf15wgvARKkg1MiLl0TWtyAIYUcEUqAIpZweXOg
 OrOoaXHyz+5fumwzlAfL7U2GFx4LHhNoL6t/xM4wsDsL5yBqeCgyj6S5nameohM7aWulyK51hts
 dKm88yX20AdGBeBH5yMnIrAt5JLPJWjDNOsiUJVAcMHgagpfKPtX6QWNU54uMdJsWmV8oi3qWVK
 GbR3f0ziW/V6h/R+5cRJUHRmvsDgwJIhE92/y7yUAM3ZCVaFUmPEyr/yUOaqjo
X-Received: by 2002:a05:600c:34d4:b0:499:79b9:e220 with SMTP id
 5b1f17b1804b1-49fe66d1279mr50023725e9.10.1790267162947; 
 Thu, 24 Sep 2026 09:26:02 -0700 (PDT)
Received: from fedora ([2a02:587:200f:d100:bf67:f785:caad:e278])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe1432362sm86586465e9.1.2026.09.24.09.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 09:26:02 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: ville.syrjala@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 mail@taterr.org, rodrigo.vivi@intel.com, taterraster@gmail.com,
 tursulin@ursulin.net
Subject: Re: [PATCH] drm/i915/display: Split i845 and i9xx cursor updates into
 arm/noarm
Date: Thu, 24 Sep 2026 19:25:58 +0300
Message-ID: <20260924162559.16680-1-mail@taterr.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arPeD2dcyUIEGGn3@intel.com>
References: <arPeD2dcyUIEGGn3@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Sep 2026 19:11:15 +0000
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

Hi Ville,

Thank you for the detailed explanation. i completely misunderstood
the purpose of the noarm/arm split regarding vblank evasion, and
i missed the interaction with the mailbox updates in the legacy
cursor path.

Given the architectural complexity required to safely split this
without disarming pending updates, I will drop this patch for now 
and leave the TODO in place.

Thanks,
George
