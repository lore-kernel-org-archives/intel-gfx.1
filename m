Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD70ECCF2E3
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 11:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA1310EAE2;
	Mon, 19 Oct 2026 11:41:51 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC6910E4A3
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 06:36:59 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6a0794669a6so2267957a12.2
 for <intel-gfx@lists.freedesktop.org>; Sun, 18 Oct 2026 23:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792391818; x=1792996618; darn=lists.freedesktop.org;
 h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
 :content-type:mime-version:message-id:date:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g2KeYWsG+wFaGgc+7I3C8q1Tb9M91ngHA9b+lWINLtQ=;
 b=dE1rGGe5cI6oNHzUJusUIInawbeD5WrD3zjI+xsCcZc6UZ3fwi5ATns3IwfSk0yGQV
 7thI3P+srZ9vf/UIaLT96GvGoeCEJUwcKUPa0rM0L27OwK3dcq3IqvhJOi68QCwKMQXO
 h8aVAe61YuOLHeRzoi3bbLAx/4e1nRIe/Q7JWUNDLklMlaSgWdnPVAkX9IuMCgSO9ZWZ
 McFQaDBUXLrgHaoX+799Vle15ARcgI3CIiK9oxLr2kXlrZ12UetH8av8FAOK1Hfx1InO
 b+Lt2MeRWZL76NQAJTdqlUW9jT5DPtYQLRM9NFS5kIr5x6WzY9oDagFPQvgE22z7lU0Y
 9ROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792391818; x=1792996618;
 h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
 :content-type:mime-version:message-id:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=g2KeYWsG+wFaGgc+7I3C8q1Tb9M91ngHA9b+lWINLtQ=;
 b=Tl7rdV+JBYZUsyBtsacRbqns6BCFl4RNcvJYwhGhEAvuTxFjhlRWYQliwTx3aTCsjr
 4vxmrJW/crw2qPTTYQmoOKUBvgvzZLI9RRjFCcQ5H1RAd2M29eZLVB6resqhFM58+fIE
 0iQBeIxP5Qr2uBceGPjtB3e18uFIA1AUXPZyaJwSFEYCESMbsIcRuWqxkPqgO8K41T4y
 UibPd1zD08+G3zMekG3MWM+c//RhGdN19fW21JRrbDe51Ew+N0rrmLFDuNViZn40+doN
 wza6pOA46WsjosUcXp3t/Rp+ah9pev+yVmJJDuCpM3h9YtG2kfGi9M9lz5QnfnHJv7kf
 hibA==
X-Gm-Message-State: AFq9FYKWao4RjqpqKXpB+9Q1wU+uM+o582S1xzU0G/Wqkd/iSI78lEGM
 E7FZ/YxJq9/inqOg59o5XLxnhVJnOH7fPHmEZOX6DJK0M86/5p7n32SW
X-Gm-Gg: AYBFou3UvCGtM5OGO/b/rAw3F2txRNf1or8qRGcUxSeEacxqPEgFMYsrOHsZ84MatjF
 Yzc+RCoOGMSU6vZKdLqNqpe2fdp95hayEDA/Ihq/U1uPSaUye6ewPCJ5SXewf2WBkP38vGeKRKD
 6xqaQBFWB/2c96qnDE/+qboR8zxbER50wovr285mkfeJ0+/JwM++iaad6Gjhy9hFk3ohSuX3YWS
 ngYKUQMpboYQZ0Pdp4iGAUwJHMVy0kSzLOuNG1WNMny73NkvkcdTsblqsnP03eGTiRtzwqzIOf/
 NjTVVgXk6XM3gi5C78Nit5hziQ7A/auJL+x+8IzTgWKx0GjJ+KUXxwn/IpLfB0uphgokzk6+DKm
 Kj3lLj/+X7IzUvAGlDYv8tZfXFLtTxXMijInBgBDcjclGWXshuHn/Wa+jcSB5tZCwXn+PdzOtj5
 QG/w5mf+4jOztX1ZygoyvQ6vldGsI6RYr38+JrTz4DeKM4ZvGrh6PSUhQT9i8Eks1TIjYj
X-Received: by 2002:a05:6402:e87:b0:6b1:abe7:825c with SMTP id
 4fb4d7f45d1cf-6b3a8175611mr3870204a12.8.1792391817776; 
 Sun, 18 Oct 2026 23:36:57 -0700 (PDT)
Received: from localhost ([2a05:d016:6cf:a600:dca7:6eb5:c61c:2b8a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b38a1b1347sm3628086a12.12.2026.10.18.23.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 23:36:57 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:36:55 +0300
Message-ID: <1792391815.ae0036ac0925@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Ioann Komarov <kivan1337@gmail.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/i915/mst: let the branch-sink check uncompressed with
 18bpp
In-Reply-To: <20260804094450.125307-1-arun.r.murthy@intel.com>
References: <20260804094450.125307-1-arun.r.murthy@intel.com>
X-Mailman-Approved-At: Mon, 19 Oct 2026 11:41:45 +0000
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

On Tue, Aug 04, 2026 at 03:14:50PM +0530, Arun R Murthy wrote:
> mst_connector_mode_valid_ctx() uses a single 18bpp floor for both

Tested on ADL-P (ThinkPad T14 Gen 3, 8086:46a6) with a Lenovo 40AY
USB-C dock (Synaptics MST branch, fw 5.6) and a 2560x1440@180 monitor
without DSC, so the dock decompresses. The link is 2 lanes of HBR3.

Without the patch the 180Hz mode is pruned with CLOCK_HIGH. With it
(backported to 7.2.8, which still has intel_dp_max_link_rate()) the
mode is listed and runs with DSC at compressed-bpp 16, port_clock
810000, lane_count 2. Logs are in
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17207

The same dock and failure on MTL are reported in issue 17207, and on
RPL-P in issue 16640.

Tested-by: Ioann Komarov <ioannkomarov@proton.me>

Adding Imre and Ankit, since the patch went out without reviewers on
Cc. Could one of you take a look?
