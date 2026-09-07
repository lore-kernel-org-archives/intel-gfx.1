Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0593C79F82
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 18:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCF310ED17;
	Tue,  8 Sep 2026 18:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="azDF9LPj";
	dkim-atps=neutral
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C192410E4B4
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 20:23:41 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-90cd1012479so51486596d6.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 07 Sep 2026 13:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788812621;
 x=1789417421; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=d7pr2QtNO9k1/kHTmwk/u2/a5M36L/fPmEgvHLhiO+o=;
 b=azDF9LPjdJ8IpYd5i4uzjRY02Uke6KA1gf1QKpjJVLLhuwaRIF3voNi5Or4HQCuy2k
 4kFVJsnvo5Ij6d4IswlrOAWkBxR1wIsq62QM991b3u44Ph7l4oY7vI3AE1FtjNKZRSPE
 mUjHOHA3rJ2WJk2W+R40Fkuel4iO/pNSWK+FNkJ6IFcSGhps672v++wFg7eyDaG4THHa
 ObMwc36otUWkyp2zRrZV29tQ4tf+4ow+UoHHPUp5OBHa+sa/Rcx5euJqAgFFmHdsSIh4
 wcWRHRgsEnHjbNM5VblV7r86+ov5Q67T03egU26EQeuX0o3v9zrIPOMuZSL6StJR5h1W
 2tyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788812621; x=1789417421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=d7pr2QtNO9k1/kHTmwk/u2/a5M36L/fPmEgvHLhiO+o=;
 b=cipBW7jD6e4m4uZerLoocWZKy8YKzXd7btIyDxyQ82p9iAutr5rmsbgQ8P4D0JUuhN
 9WPuof2cA4K7P6qWXvF1jsXwIhgpl+1SCGbQ8T1+2Rq7ETQIUV8ji8pmlUPuwti9GMFG
 M8b3v34XZDUdRUymDYsIKScnkexjx370Hkarv48hCu1KAAsQFtGeBXjFk1qUZRlojS2L
 GGhHH9EnvPxpk4yyDQj+Y9V6ZRNqBD5fvwXupZCA0yp+++VN/BzgpV8iZmcpy80/AvRJ
 v61NI3mLNEgMkwLMw4DvcOeM/CfvMF2bGJxMMpdZY5JhGtMNjaLO8nWEV6GPzkD+292n
 /4pg==
X-Gm-Message-State: AFuF++mHonn1Z98YyTVJI7OIFsUIQ00am5Wkk8+UJ+khGqmaPMb9vYF6
 Akmr4ZJW8xHy+t0W1jFMlLzQPeio79lIt0RuTWgFefXuJaTekr40tLJ8+LD4EMSOkxGleMcNz5f
 QgovBfaql+yzKMxUatXBZks/etSHSdirjkrI71orto4/D5vmbQ3bVw/5kY09mrpBvK+XpL8wb6A
 aE5r3YXoeNW8ZLr4uAhIkD6u9ZwY1j38DwQUNS43UbbHtkIWP1UoAr2NI=
X-Gm-Gg: AYBFou2pMpqDWkdugXekmEHgiaP+ks72Qe51ZVTXHHMm+CZa2fddafOh6Ja+uWpjRQU
 XFpg5WAzgXQ6/7M2+up+96rrOnnaxulwgEHzN7LkC9imaxuj+5uL2AKbg1xGLxpRsMRaJXSc+F2
 eSFi7Z/E+v93CctdS58I1JsaQJpHOCeEqJ85UL7ysWHUt6oWZ6i73N9WIxGqxsu7PBhX6tEsPtd
 Bjt/7hy3rVuOpPKL+UmOQs3nCouLVCmo9t4mS8mlXe1GHQJOE4BonCldM30DYs0psZXpqJfbcf1
 v8BSaJPQYdM9FvY74EArINe44Pd2fSwK8H/Qhg2PlHjChsEVBLq1uwFaNmiDA7PgVptSrLSaGpA
 2PNPj1/7kuDR9HIHAHCcEYZRJnQwkB7aOhbmPb+wR6bzWk2DTHG+BZ5LKUSkskL2DuWqd/eVYCx
 z3RsWHZGr1OAso0DbFWdel3sa+61fV4UBGtiMfObGp0URqh8fd8RtnNqegCbQxWbmv4er64ULOt
 lz7ANnzx/Vl6f6Qt7ioobvgsel1+2JYiU3CWazR6QTIhqbou0Ol8KkbG9BtryHHXFkVPUwHZ2YU
 j4+ueMl5DEt7DQ9Klb1S9POqU/OfUXqyBB08tHpQ8Z1QRwvJgp1n7TDfwh2c
X-Received: by 2002:a05:620a:3185:b0:939:72cb:baf5 with SMTP id
 af79cd13be357-93972cbbce3mr2392073585a.44.1788812620426; 
 Mon, 07 Sep 2026 13:23:40 -0700 (PDT)
Received: from jake-laptop ([74.244.125.129]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9398c498610sm788695085a.43.2026.09.07.13.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 13:23:39 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, animesh.manna@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [BUG] PTL eDP PSR2 SU / Panel Replay: engine parks in SU_STANDBY,
 panel never refreshed (Dell XPS 16 DA16260)
Date: Mon,  7 Sep 2026 16:23:36 -0400
Message-ID: <20260907202337.152269-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903135227.105232-1-j@metarealtyinc.ca>
References: <20260903135227.105232-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Sep 2026 18:37:36 +0000
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

Update, details and files on the gitlab issue:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9119

Jouni posted an xe_reg_rw trace from a PTL system where Panel Replay
works (1920x1200 panel, no DSC). I captured the same trace here and
diffed the two. The PR enable sequence and every PSR, ALPM, VRR and
push register match, apart from fields derived from the panel timing
and link rate. What is left: this panel needs DSC (2 VDSC engines,
10 bpc input), his does not; DC6 is allowed on his system and blocked
here by the compositor keeping vblank enabled; PSR_IMR.

Second finding: in Panel Replay, which uses the aux-less ALPM wake
here, the sink latches the Link CRC error in
DP_PANEL_REPLAY_ERROR_STATUS on every compositor commit (about 40 of
86 polls over 20 s, tracking a blinking cursor). It does not depend on
the aux-less wake lines, the PORT_ALPM_CTL silence period, the LFPS
half cycle or cycle count, PHY swing hold, sleep hold, or the sink's
CRC verification bits. PSR1 polled the same way stays clean. So PR
here is the same failed-wake resync loop PSR2 had before the fast wake
patch, and PSR2 with that patch is the other half: clean link, no
SU_VALID ever, engine parked in SU_STANDBY, frozen panel.

One driver observation: enabling PR through the i915_edp_psr_debug
fastset does not program PORT_ALPM_CTL / PORT_ALPM_LFPS_CTL, since
intel_alpm_port_configure() only runs from the DDI enable path.

Open question: is there a PTL system with a DSC eDP panel where PR or
PSR2 selective update is confirmed working? The other two PTL reports
(#8924, #8930) are 2880x1800 and 2560x1600 at 120 Hz panels.

Jake
