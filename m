Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619F2CA5FA2
	for <intel-gfx@archiver.kernel.org>; Mon, 28 Sep 2026 13:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE35E10EA96;
	Mon, 28 Sep 2026 13:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="cRZPqkJK";
	dkim-atps=neutral
Received: from mail-qv2-f42.google.com (mail-qv2-f42.google.com
 [74.125.230.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D3B10E4F1
 for <intel-gfx@lists.freedesktop.org>; Mon, 28 Sep 2026 12:23:55 +0000 (UTC)
Received: by mail-qv2-f42.google.com with SMTP id
 6a1803df08f44-9144fbfdc76so18467556d6.2
 for <intel-gfx@lists.freedesktop.org>; Mon, 28 Sep 2026 05:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1790598235;
 x=1791203035; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ackCyxWNUU3rNFIvxE9uMr/6z+0jDu2f3tDqHq/JIMo=;
 b=cRZPqkJK5jiZ/3O2iBCqvxbPVB/92uVgqH5YAO97sUFputThiBrUyVo4cUCZYiKzg+
 QGeQffju81/8MGgcG9crjEk6N953GJO4vruFTDUzLNKmWRejAp6oH2ddSfMmJlwmaJDi
 rFcNqgzPfDrSo/BBi6/HDExUfWaKp3F+57I4dKW8yYv1BUPd0xaSiihxfxhpfheCIoOm
 KethtFt9TN2q4Km/w6uSD9zk6PDYKYgdkmxLJTf2b+Uc/yPOTKFXpt9dG1j8ey9e10c/
 HliPzAe/kqepFYhyjeLM1OqxsQb6nucoyjXhcxRRRPpVuqqLF7m35cZiN8xoJKr1Iqt9
 LzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790598235; x=1791203035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ackCyxWNUU3rNFIvxE9uMr/6z+0jDu2f3tDqHq/JIMo=;
 b=zR+dvn1N+/13Tf2QCW8Obr/W3KpT75RNld4mlfQ+G9tGLXSGbk72d1aPM7EioWVKxf
 13pIVK04r8aqvzhaeAbpONi0up+KIgwvs9PSM4B0OdkDLI/2JxqeeNykLvlMQ1RM4DWV
 XUbcV9RXQkDFTxpVxznTGJpaBg3ptcRWqlTBFqjxfOJLk7OGb6n6qDq1YlhkXVenlm5G
 aq2BMgYqNAuNyAqfMZrjRYeMonC5KODrIBHsUBVg8RfBmaVadvPXr3SoWszE8MwTdeUo
 bGwZWyWirMxoDRFkl9F7IC6wXn01mElHcd+Uq8yaSv0MYQ3LZmv7T13ZcKFEgJhDJhN3
 /K7Q==
X-Gm-Message-State: AFuF++mVKndYH8cvr+qJNs7g4/9F9KjEIeWucWGyd0Tejh+fYG1m/hLD
 39vYF46xTbqL+m+Zi96bS7uaPTITWt242WltR71/YVwnXRkSVx1Whuk7w0zi6b/uyyAoXXxZ1Gd
 IP1b5tleRRAkd3aopvV9dPzrNDNkdpyKpR94P099AlJy5w4YXmUJfLLJ6nQj9MpoXWmT53sSLbl
 DP02COK2vu+/z3LFcIlZSdsQx4YD/tYrenXtf60C76eShr572SKK3BcthXAw==
X-Gm-Gg: AYBFou1XPck1VRpVfYCUhv4vddviKTTuoBEn0RYJ3L8vPSHb//xnXe8W9Bv1htw5y8d
 hS2zzKntOchYjToGHGVRoFme7Avsvn9GESlr6d8CNwaZNH8teRZL4SQhlwB8j2FgmJoZyY9ZVej
 +e5ZWXr9eOLSv8wRpeTJ4YDIRGZej6NTrjmuaYLcna/dTgJAp/x1h7y3Do9QxjP0o6Z2r6EkQ3G
 NCaUXo9D6oxyt0HgoYZJrqsCdPuglIHeuB83rhji35WmBWMXBE151BfAXtjM2Q3+ta2jBz9ZWFu
 A2zX7/mRErYvP+BP3mdZB0plJeDELTKufuiz5TnJkAYfoF7dfE+40xbwPbVnuD3suYMdXRgNs4Z
 ibYy+XDk0T/ibXabNvVeF6xSwIc/NQU1IaJWcBSVLZXHbmgpoO1drwofKZC9ldV9g2KHvef3la3
 1GwLiGK+E+kSh8eyYsdoOH0GNh9ku4fDXH75ikkpQIeYJeQ/pLZB2Uo0aA2LLxfGIvTadTOHgEe
 AHoGCtrK8LLRfLEaKY652K2JSHztyvQK5otjSu67lZqy7uQ3HNb7zbXy4tjJPDRtUa4N18z/CKr
 Elf+tuAvCfOd0RwdT7J1EeZgLK6ArYnl8Ab+yKTuBDYKBMabf3nD
X-Received: by 2002:a05:620a:370d:b0:93b:d7a2:83cc with SMTP id
 af79cd13be357-93c43d235b9mr2074892585a.59.1790598234553; 
 Mon, 28 Sep 2026 05:23:54 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91430da9123sm78933846d6.16.2026.09.28.05.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 05:23:53 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 jouni.hogander@intel.com, animesh.manna@intel.com,
 ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH] drm/i915/dp: Don't promise AS SDPs in PR Active when they
 are disabled
Date: Mon, 28 Sep 2026 08:23:52 -0400
Message-ID: <20260928122352.51004-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923041342.2146450-1-j@metarealtyinc.ca>
References: <20260923041342.2146450-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 28 Sep 2026 13:59:47 +0000
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

Hi Jouni, all,

Gentle ping, with an update on the stutter left open in the notes.

AS SDP bursts turned out not to be reliable on this panel, but leaving
the AS SDP on in PR Active is always smooth, also with 0x107 bit 6
clear. What works here now: clear PR_ALPM_CTL[AS SDP Transmission in
Active Disable] while vblank interrupts are enabled and set it again
when they are disabled. PR already holds DC_OFF while vblank is on
(intel_psr_notify_vblank_enable_disable()), so this costs no DC5/DC6
residency. Smooth here so far; I switched to it this morning.

Would that be acceptable upstream for sinks with async video timing in
PR? Happy to send it as an RFC on top of this patch.

Thanks,
Jake
