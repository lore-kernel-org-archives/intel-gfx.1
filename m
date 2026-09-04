Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9A2C79F82
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 18:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E6D10ED27;
	Tue,  8 Sep 2026 18:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="gMFOM89M";
	dkim-atps=neutral
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CFD10F977
 for <intel-gfx@lists.freedesktop.org>; Fri,  4 Sep 2026 13:32:35 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-9391252b5caso65175885a.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 04 Sep 2026 06:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788528754;
 x=1789133554; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nUDERenzGagFWWWNYxzhz036bpMy1iX3Z2WSyHGWcNI=;
 b=gMFOM89Mh7O1cuAhCQbPxC0aJ0fovGCTnWxLjayOO/rhx8RygJ3N3hNZIhMO6r/T1f
 OXesTmhdszXW6JjO4SFGXvYEnRu9ARvIatsJq7jORv7tcwjoQYnz9yVOP3wrq++w0CuC
 JTZHcAsWsHSlgF3JU4AzHuRrvDEHeJFbW7fLQyWU1dcvVmt4RgCMiwWfx6x1YCCVOcp/
 QfI17oeQcW6Q1ZbKMUKBRFMKLGTc3ihVAoUq/gxU7o9z7WtjhDGajb5fY7K627cEqjCt
 eYh/rqifZZBqXJsarqeWJuyWB+AD5MibiO0BVAjquSlXmSpGHM7Ztid6MDinzoSiFGyN
 DtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788528754; x=1789133554;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nUDERenzGagFWWWNYxzhz036bpMy1iX3Z2WSyHGWcNI=;
 b=SzbIar9w+HEY35o0W/w85n7m/GNKAfksswAV6Fzxr6sWwiUziJLEibz9jce11kF/XY
 p2JbNwXo6NLD7Bb2Ue7mkpUYjse9OttnXFCu4YBa3UcPDnmfb4XpRDtbKeo02bK+maD7
 oh7o/x2kSOtrPn1mgTOEs5sqi/3QFP0gr8ZZZ0vQvjPmwpFRlCd/i4C6OUGFFXoIn9bS
 JdsIpkPCMH9WN2WUajra6/Z8Jbs+vCS0NjfXErEnJ5tWvvaHBGBJwR6tCqdT1FuUgPKV
 dJaOkWjetSP3rcGouKJrTq9At2a59CeVG+u/aeZ94cl9rI4A0KgRe8NU9+ZTUteJFBOb
 SKMw==
X-Gm-Message-State: AFuF++kbJa6wLjbazraOrdwSJvI8W4s0INw1hwWIt2qWd23S4moKZ0Ut
 YK26w+ddVkN2qEFwTdWK6OJDegS8iBoIbW+Fw6XvUCE9/stJj1daEfe/HBuKfJ81OcTcExMTEe1
 SVI8jdtn7PRmZm0zYaqBcJqfAX2LAuFJdf5AR/v/NmWt254UvCaPC0jgYJA9x8Kwf0Tk//8DUDs
 3fCYekE70URJNrO/qxVvwnV8ahV9CZGTNxbv6wOxtkPGOBEjmiOB/vK/I=
X-Gm-Gg: AYBFou2JrgWeWa34pXVB5UQI08VNi33VmgMloJK36gXsmDRuMSrW7M9apwWE0B8YQuS
 7rD1qnMPQreBfXO7xzJyW8v/PomzdYTBJQc2whFQpMx6GVM3TDnyBGEoJgSwm0aNBGkOBI7YMbJ
 59MBT9JmXTPeY2dkTcwf+rpxK6RqKm5OI6HfVt18NjNE9OobIzMxxblBItgVs94YYLDX3lKakpO
 FdOcvNHO4/9e8hMe7G4GY2fqPtt1HV5X7iB3rXShSpFuTY+ZnrOHtLfUtEkz9KTBkeeOnXA3M3r
 ZFfFQhqDLzLa3cUDpdqhLzvQhWyuOhS1UWjUmYE7qUGdTh9KT5Rh2dXZp8ZQXGiG/dugW+AdbbJ
 oiImW3D+DDVHp2ngq9UG8IToMT8mLzcgamNtN7wYEe1fT3cS1Gwtvdyv/dONpMtx8tEsQ7xmJD0
 vH3YXO/CcI4XNwY+pPdDAqgLed9L9JK3lobwkzDvVGbGAXEE/8ZAIUPEua2aKCoW2kXbVq5DCb4
 CV62U6LJ/m35IAhHQYOuRgRPNWZ27elGuBhFyyRCUiSTAe6/XY2QzbOjakPrT7LV2b1qv4KnWmk
 IiYMaHhlZMrCVd+odgN6c3nJPIjKNrl4/tLcS1V3+oUIziLXq1qVHu6RzRL8sx/7QqwG
X-Received: by 2002:a05:620a:870d:20b0:939:6df9:1278 with SMTP id
 af79cd13be357-939804c0ce4mr468511785a.51.1788528754174; 
 Fri, 04 Sep 2026 06:32:34 -0700 (PDT)
Received: from jake-laptop ([153.67.39.26]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91041fa4d65sm14043076d6.15.2026.09.04.06.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 06:32:33 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3] drm/i915/alpm: Add a quirk to keep the fast wake ahead
 of the IO buffer wake
Date: Fri,  4 Sep 2026 09:32:31 -0400
Message-ID: <20260904133231.9028-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904114835.483057-1-j@metarealtyinc.ca>
References: <20260903131724.49496-1-j@metarealtyinc.ca>
 <20260904004308.185788-1-j@metarealtyinc.ca>
 <20260904114835.483057-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Fri, 2026-09-04 Jouni Högander wrote:
> I think PSR2 was working on that setup at the point when I introduced
> that quirk
> ...
> Maybe this is actually matter of bisection?

Checked that today with a probe that only polls the sink (0x2006,
0x2008, 0x200a every 200 ms, error bit cleared after each read), so it
runs the same on any kernel:

  stock 7.2.2, io/fast 11/11:    CRC error re-latched on every poll,
                                 0x2008 = 3 throughout,
                                 0x200a shows SU_VALID in 2 of 94 polls
  7.3-rc1, io/fast 11/11:        same, SU_VALID in 7 of 90 polls
  7.3-rc1, io/fast 11/12:        no CRC errors, 0x2008 = 2,
                                 SU_VALID never

So what looks like PSR2 working is the link failing on every wake and
the engine re-entering over and over. Each re-entry does its two entry
captures, those carry SU_VALID, then the engine parks in SU_STANDBY
until the next failed wake resets it. Screen updates come from the
resyncs, not from selective updates. With the wake clean there are no
resyncs and the panel stays on the stale frame.

I doubt bisecting finds anything for PSR2: it was in this state in
April too unless the wake formulas were different then, and
intel_alpm.c has four commits since March, none touching them. Panel
Replay uses the aux-less wake, which does not fail, so it froze
outright from the start. That is the quirk.

Probe script and logs are on 9119.

Jake
